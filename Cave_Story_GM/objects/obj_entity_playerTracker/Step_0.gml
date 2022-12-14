/// @desc 

event_inherited();

if instance_exists(PLAYER)
{
	var _xdist = -0, _ydist = -0;
	
	x = PLAYER.x + _xdist;
	y = PLAYER.y + _ydist;
}