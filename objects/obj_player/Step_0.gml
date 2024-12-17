/// @description Insert description here
// You can write your code in this editor
if(pl_health<1)
{
	room_goto(Room3);
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


if(castspell)
{
var _bulletinst = instance_create_depth ( x, centerY, depth - 100, obj_bullet );

with( _bulletinst)
{
dir = other.aimDir1;	
}
castspell = false;
}

if(castfbspell)
{
var _bulletinst = instance_create_depth ( x + 20, centerY , depth - 100, obj_bullet );
_bulletinst.fireball = false;

with( _bulletinst)
{
dir = other.aimDir1;	
}

var _bulletinst1 = instance_create_depth ( x - 20, centerY , depth - 100, obj_bullet );
_bulletinst1.fireball = false;

with( _bulletinst1)
{
dir = other.aimDir1;	
}
castfbspell = false;
}

if(castuspell)
{
var _bulletinst = instance_create_depth ( x, centerY, depth - 100, obj_ubullet );

with( _bulletinst)
{
dir = other.aimDir1;	
}

var _bulletinst2 = instance_create_depth ( x, centerY, depth - 100, obj_ubullet );

with( _bulletinst2)
{
dir = other.aimDir1 - 20;	
}

var _bulletinst1 = instance_create_depth ( x, centerY, depth - 100, obj_ubullet );

with( _bulletinst1)
{
dir = other.aimDir1 + 20;	
}
castuspell = false;
}