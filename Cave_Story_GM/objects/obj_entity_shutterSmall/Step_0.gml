/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(10):
		//move();
		var _dir = dirAngle(entityDirection), _spd = 0.5;
		x += lengthdir_x(_spd, _dir);
		y += lengthdir_y(_spd, _dir);
		break;
}