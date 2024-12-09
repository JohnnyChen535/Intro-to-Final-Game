/// @description Insert description here
// You can write your code in this editor
if (bullet_hit = false)
{
y += bullet_speed;
}
else
{
	y = y;
}

if(bullet_hit && image_index >= 5)
{
	
	instance_destroy();
}

