/// @description Insert description here
// You can write your code in this editor
enum STATES
{
	DEALPL,
	CHOOSE,
	RESOLVEPL,
	UPGRADE,
	RESHUFFLE
}


hand_x_offset = 100;

num_cards = 9;
num_ucards = 9;

deck = ds_list_create();
player_hand = ds_list_create();
player_selected = ds_list_create();
uplayer_selected = ds_list_create();
upgradecard = ds_list_create();
upgrade_hand = ds_list_create();
upgrade_selected = ds_list_create();
discard = ds_list_create();
move_timer = 0;
global.upgrade = false;

for (var _i = 0; _i < num_cards; _i++)
{
	var _new_card = instance_create_layer(x,y,"Instances", obj_card);
	_new_card.face_index = _i % 2;
	_new_card.face_up = false;
	_new_card.card_choosen = false;
	_new_card.in_player_hand = false;
	_new_card.target_x = x;
	_new_card.target_y = y;
	ds_list_add(deck, _new_card);
}

for (var _ucard_i = 0; _ucard_i < num_ucards; _ucard_i++)
{
	var _u_card = instance_create_layer(x,y,"Instances", obj_ucard);
	_u_card.face_index = _i % 2;
	_u_card.face_up = false;
	_u_card.card_choosen = false;
	_u_card.in_player_hand = false;
	_u_card.in_upgrader_hand = false;
	_u_card.target_x = x - 300;
	_u_card.target_y = y;
	ds_list_add(upgradecard, _u_card);
}

randomize();
ds_list_shuffle(deck);

for(var _i = 0; _i < num_cards; _i++)
{
	deck[| _i].depth = num_cards - _i;
		deck[| _i].target_y = y - (2 * _i);
}

function arrange_hand_cards(hand_list, base_x, base_y, offset_x) {
    for (var i = 0; i < ds_list_size(hand_list); i++) {
        var card = ds_list_find_value(hand_list, i);
        card.target_x = base_x + i * offset_x;
        card.target_y = base_y;
    }
}



global.state = STATES.DEALPL;