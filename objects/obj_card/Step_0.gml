/// @description Insert description here
// You can write your code in this editor

if(card_is_in_hand)
{
				target_y = mouse_y;
				target_x = mouse_x;
				global.holding_card = true;
}


switch(global.state) {
	case STATES.CHOOSE:

		if(in_player_hand && face_up)
		{

			if(card_is_in_hand)
			{
				if(y < 520 && mouse_check_button_released(mb_left))
				{
				audio_play_sound(snd_playcard, 10, false);
				if(face_index == 1){
				with (global.player) 
					{
					castspell = true;
					}
				}
				else if(face_index == 0){
				with (global.player) 
					{
					castfbspell = true;
					}
				}	
				ds_list_add(obj_dealer.player_selected, id);
				card_is_in_hand = false;
				}
				else if(y > 520 && mouse_check_button_released(mb_left))
				{
				card_is_in_hand = false;
				}
			}

			else if(position_meeting(mouse_x, mouse_y, id) &&
			mouse_check_button(mb_left)) 
			{
				card_is_in_hand = true;
			}

		}
		break;
			case STATES.UPGRADE:

	if(in_player_hand && face_up)
	{

		if(position_meeting(mouse_x, mouse_y, id) &&
		mouse_check_button_pressed(mb_left)) 
		{
			face_up = true;	
			target_y = room_height *0.8 - 175;
			target_x = room_width/2.75 + 100;
			audio_play_sound(snd_deal, 10, false);
			ds_list_add(obj_dealer.uplayer_selected, id);
		}
	}
	default:

		break;

}



