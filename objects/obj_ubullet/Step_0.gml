/// @description Insert description here
// You can write your code in this editor
if (bullet_hit) {

  sprite_index = spr_lavaballhit;

    }
 else {
    sprite_index = spr_lavaballbullet;
}


if (bullet_hit = false)
{
xspd = lengthdir_x (spd , dir);
yspd = lengthdir_y( spd , dir );
x += xspd;
y += yspd;
}
else
{
	y = y;
	x = x;
}

if(bullet_hit && image_index >= 5)
{
	
	instance_destroy();
}

