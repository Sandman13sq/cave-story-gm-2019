/// @desc 

// Inherit the parent event
event_inherited();

/// @desc 

switch(state)
{
	// Look at Player
	case(2):
		var _x = x + center_x, _y = y + UNIT_PX, _w = 64, _h = UNIT_PX;
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
		{
			if collision_rectangle(_x - _w, _y - _h, _x + _w, _y, PLAYER, false, true)
			entityLookAtPlayer();
		}
		break;
}
