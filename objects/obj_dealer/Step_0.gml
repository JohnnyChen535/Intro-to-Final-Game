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
			
			obj_enemycontroller.state = EnemyState.STOP;
                var _upgrade_card = ds_list_find_value(upgradecard, 0);
                ds_list_delete(upgradecard, 0);
                ds_list_add(upgrade_hand, _upgrade_card);
                _upgrade_card.in_upgrader_hand = true;
                _upgrade_card.face_up = true;
                
                for (var i = 0; i < ds_list_size(upgrade_hand); i++) {
                    var _2_handcard = ds_list_find_value(upgrade_hand, i);
                    _2_handcard.target_x = room_width / 3.2 + i * hand_x_offset;
                    _2_handcard.target_y = room_height * 0.4; 
                }
            } 
			else {
			 if (ds_list_size(uplayer_selected) > 0) {
            var selected_hand_card = ds_list_find_value(uplayer_selected, 0);
            var selected_upgrade_card = noone;

            // 检查是否点击了升级牌
            for (var i = 0; i < ds_list_size(upgrade_hand); i++) {
                var upgrade_card = ds_list_find_value(upgrade_hand, i);
                if (upgrade_card.card_choosen) { // 如果升级卡牌被选择
                    selected_upgrade_card = upgrade_card;
					upgrade_card.card_choosen = false;
                    break;
                }
            }

            // 确保两个卡牌都被选择后才能交换
            if (selected_hand_card != noone && selected_upgrade_card != noone) {
                // 1. 将选中的玩家手牌加入升级卡牌列表
                ds_list_delete(player_hand, ds_list_find_index(player_hand, selected_hand_card));
				instance_destroy(selected_hand_card);
               // ds_list_add(upgradecard, selected_hand_card);
               // selected_hand_card.target_x = room_width / 3.5 + ds_list_size(upgradecard) * hand_x_offset;
               // selected_hand_card.target_y = room_height * 0.7;
                //selected_hand_card.in_upgrader_hand = true;
				

                // 2. 将选中的升级卡牌加入牌库
                ds_list_delete(upgrade_hand, ds_list_find_index(upgrade_hand, selected_upgrade_card));
                ds_list_add(player_hand, selected_upgrade_card);
				selected_upgrade_card.in_player_hand = true;
                selected_upgrade_card.face_up = true;
       //         selected_upgrade_card.target_x = 106;
         //       selected_upgrade_card.target_y = y - ds_list_size(deck) * 2;

                // 更新手牌排列
             //   arrange_hand_cards(player_hand, room_width / 2.75, room_height * 0.9, hand_x_offset);

                // 更新升级手牌排列
               // arrange_hand_cards(upgrade_hand, room_width / 3.5, room_height * 0.7, hand_x_offset);

                // 清空选择
                //ds_list_clear(player_selected);

                show_debug_message("Cards exchanged!");
            }
        }

        // 如果玩家完成选择，将 `upgrade_hand` 中的卡牌放回 `upgradecard`
        if (ds_list_size(uplayer_selected) == 1 && ds_list_size(upgrade_selected) > 0) {
            while (ds_list_size(upgrade_hand) > 0) {
                var upgrade_card = ds_list_find_value(upgrade_hand, 0);
                ds_list_delete(upgrade_hand, 0);
                ds_list_add(upgradecard, upgrade_card);

                // 更新卡牌目标位置
                upgrade_card.target_x = room_width / 3.5 + ds_list_size(upgradecard) * hand_x_offset;
                upgrade_card.target_y = room_height * 0.7;

					}
				ds_list_clear(upgrade_selected);
				ds_list_clear(uplayer_selected);
				global.upgrade = false;
				obj_enemycontroller.state = EnemyState.GENERATE;
				global.state = STATES.CHOOSE;
				}
            }			
			

	}
	break;

    case STATES.CHOOSE:
	if(move_timer ==0){
	if(global.upgrade = true){
				global.state = STATES.UPGRADE;
				}
        if(ds_list_size(player_selected) > 0) {
            var _player_chosen = ds_list_find_value(player_selected, 0);
			//var _index = ds_list_find_index(player_selected,_player_chosen)
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
           // ds_list_clear(player_selected); // Clear the player_selected list

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



