/// @description Insert description here
// You can write your code in this editor

if (enemy_dead == false)
{

    var target_x = obj_player.x;
    var target_y = obj_player.y;

    var angle_to_player = point_direction(x, y, target_x, target_y);

    var _speed = global.enemy_speed;
    var speed_x = lengthdir_x(_speed, angle_to_player);
    var speed_y = lengthdir_y(_speed, angle_to_player);

    x += speed_x;
    y += speed_y;
}
else
{
    y = y; 
}


if(y>770)
{
global.enemy_count--;
instance_destroy();
}

if (death_animation_done) 
{
    instance_destroy(); 
}