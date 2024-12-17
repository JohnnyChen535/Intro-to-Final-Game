/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(fnt_score); 




//var _weaponYsc1 = 1;



draw_sprite_ext(wand, 0, x, centerY, 1, 1, aimDir, c_white, 1);

//draw_text(200, room_height - 200, string(aimDir1));

draw_self();
draw_text(20, room_height - 50,  string(pl_health));

