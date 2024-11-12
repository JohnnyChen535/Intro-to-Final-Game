/// @description Insert description here
// You can write your code in this editor
if (enemy_dead) {

  draw_sprite(spr_edeath, image_index, x, y);
 instance_destroy();
    }
 else {
    draw_sprite(spr_ewalk, -1, x, y);
}