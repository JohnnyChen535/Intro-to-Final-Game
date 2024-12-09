/// @description Insert description here
// You can write your code in this editor

if (enemy_dead = false)
{
y += global.enemy_speed;
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