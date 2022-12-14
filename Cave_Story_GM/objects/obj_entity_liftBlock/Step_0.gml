/// @desc 

// Inherit the parent event
//event_inherited();

switch(state)
{
	case(10):
		//move();
		var _dir = dirAngle(entityDirection), _spd = 0.5;
		x += lengthdir_x(_spd, _dir);
		y += lengthdir_y(_spd, _dir);
		break;
}

tileFrameStep = loop(tileFrameStep + 0.05, 0, 4);

switch(floor(tileFrameStep))
{
	case(0): tileFrame = 0; break;
	case(1): tileFrame = 1; break;
	case(2): tileFrame = 2; break;
	case(3): tileFrame = 1; break;
}