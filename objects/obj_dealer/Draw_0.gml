/// @description Insert description here
// You can write your code in this editor


draw_set_color(c_red);
draw_set_font(fnt_score); 


draw_self();
draw_text(10, room_height - 100,  string(global.body_count));