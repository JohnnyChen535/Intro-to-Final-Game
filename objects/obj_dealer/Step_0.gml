/// @description Insert description here
// You can write your code in this editor



switch(global.state) {
    case STATES.DEALPL:
        if(move_timer == 0) {
            var _player_num = ds_list_size(player_hand);
            if(_player_num < 3) {
                var _dealt_card = ds_list_find_value(deck, 0);
                ds_list_delete(deck, 0);
                ds_list_add(player_hand, _dealt_card);
                _dealt_card.in_player_hand = true;
                _dealt_card.face_up = true;
                
                for (var i = 0; i < ds_list_size(player_hand); i++) {
                    var _1_handcard = ds_list_find_value(player_hand, i);
                    _1_handcard.target_x = room_width / 2.75 + i * hand_x_offset;
                    _1_handcard.target_y = room_height * 0.9; 
                }
            } else {
                show_debug_message("handfull");
				if(global.upgrade = true){
				global.state = STATES.UPGRADE;
				}
				else{
                global.state = STATES.CHOOSE;
				}
            }
        }
        break;
		
	case STATES.UPGRADE:
	if(move_timer ==0){
		var _upgrade_num = ds_list_size(upgrade_hand);
		if(_upgrade_num <3){
                var _upgrade_card = ds_list_find_value(upgradecard, 0);
                ds_list_delete(upgradecard, 0);
                ds_list_add(upgrade_hand, _upgrade_card);
                _upgrade_card.in_upgrader_hand = true;
                _upgrade_card.face_up = true;
                
                for (var i = 0; i < ds_list_size(upgrade_hand); i++) {
                    var _2_handcard = ds_list_find_value(upgrade_hand, i);
                    _2_handcard.target_x = room_width / 2.75 + i * hand_x_offset;
                    _2_handcard.target_y = room_height * 0.9; 
                }
            } else {

            }			
			
	global.upgrade = false;
	global.state = STATES.CHOOSE;
	}
	break;

    case STATES.CHOOSE:
	if(move_timer ==0){
        if(ds_list_size(player_selected) > 0) {
            var _player_chosen = ds_list_find_value(player_selected, 0);
            ds_list_delete(player_hand, _player_chosen);
            global.state = STATES.RESOLVEPL;
        } else {
            for (var i = 0; i < ds_list_size(player_hand); i++) {
                var _2_handcard = ds_list_find_value(player_hand, i);
                _2_handcard.target_x = room_width / 2.75 + i * hand_x_offset;
                _2_handcard.target_y = room_height * 0.9;
            }
        }
	}
        break;
		
case STATES.RESOLVEPL:
    if (move_timer == 0) {
        var _player_num = ds_list_size(player_selected);
        
        // Only proceed if player_selected is not empty
        if (_player_num > 0) {
            var _hand_card = ds_list_find_value(player_selected, 0);

            // Add the selected card to the discard list
            ds_list_add(discard, _hand_card);

            // Remove the selected card from player_selected
            ds_list_delete(player_selected, 0);
            ds_list_clear(player_selected); // Clear the player_selected list

            // Also remove the card from player_hand
            var card_index_in_hand = ds_list_find_index(player_hand, _hand_card);
            if (card_index_in_hand != -1) {
                ds_list_delete(player_hand, card_index_in_hand);
            }

            // Update discard list display properties
            var _discard_size = ds_list_size(discard);
            for (var _i = 0; _i < _discard_size; _i++) {
                var _discard_card = ds_list_find_value(discard, _i);
                _discard_card.depth = _discard_size - _i;
                _discard_card.target_y = y + 200 - (2 * _i);
            }

            // Set properties for the newly added discard card
            _hand_card.target_x = 106;
            _hand_card.in_player_hand = false;
            _hand_card.face_up = false;
        } else {
            // Handle other states if no card is selected
            if (ds_list_size(deck) == 0) {
                global.state = STATES.RESHUFFLE;
            } else {
                global.state = STATES.DEALPL;
            }
        }
    }


		break;
	
	
	case STATES.RESHUFFLE:
	if(move_timer ==0){
		
	if(ds_list_size(deck) <7) {
	randomize();
	ds_list_shuffle(deck);
	var _dis_num = ds_list_size(discard);
	if(_dis_num >0){
		var _dis_card = ds_list_find_value(discard, 0);
		ds_list_delete(discard, 0);
		ds_list_add(deck, _dis_card);
		_dis_card.target_x =106;
		var _deck_size = ds_list_size(deck);
    for (var _i = 0; _i < _deck_size; _i++) {
        var _deck_card = ds_list_find_value(deck, _i);
        _deck_card.depth = _deck_size - _i;
        _deck_card.target_y = y - (2 * _i);
		}
	}
		}else{

	global.state = STATES.DEALPL;
		}
	}
		break;
}


move_timer++;
if(move_timer == 16) {
	move_timer = 0;
}



