/// @description Insert description here
// You can write your code in this editor

switch(global.state) {
	case STATES.CHOOSE:

		if(in_player_hand && face_up)
		{

			if(position_meeting(mouse_x, mouse_y, id) &&
			mouse_check_button_pressed(mb_left)) 
			{
				//flip the card
				face_up = true;	
				target_y = room_height *0.8 - 175;
				target_x = room_width/2.75 + 100;
				ds_list_add(obj_dealer.player_selected, id);
				instance_create_layer(obj_player.x, 500, "Instances", obj_bullet);
				
			}
		}
	default:

		break;

}


