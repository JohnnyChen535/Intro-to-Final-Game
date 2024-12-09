/// @description Insert description here
// You can write your code in this editor
if(pl_health<1)
{
	game_end();
}



aimDir1 = point_direction(x, y, mouse_x, mouse_y);
//aimDir2 = clamp(aimDir1, 0 , 180);
if(aimDir1 >270)
{
aimDir2 = 0;
}
else if(aimDir1 >180)
{
	aimDir2 = 180;
}
else
{
	aimDir2 =aimDir1;
}
	
aimDir = aimDir2 - aimdif;


