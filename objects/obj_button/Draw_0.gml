/// @description Insert description here
// You can write your code in this editor


if(abs(y - target_y) > 1) 
{
	y = lerp(y, target_y, 0.2);
} else {
	y = target_y;
}
 sprite_index =spr_back;

draw_sprite(sprite_index, image_index, x, y);

draw_set_font(title_font);

// 设置字体颜色
draw_set_color(c_white);

// 设置对齐方式（可选）
draw_set_halign(fa_center); // 水平居中对齐
draw_set_valign(fa_middle); // 垂直居中对齐

// 绘制标题
draw_text(room_width / 2, room_height / 4, "Wizard Deck");