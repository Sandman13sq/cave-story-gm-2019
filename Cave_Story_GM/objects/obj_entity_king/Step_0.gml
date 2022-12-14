/// @desc 

switch(state)
{
	// Look at Player
	case(0):
		var _x = x + center_x, _y = y + UNIT_PX, _w = 64, _h = UNIT_PX;
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
		{
			if collision_rectangle(_x - _w, _y - _h, _x + _w, _y, PLAYER, false, true)
			entityLookAtPlayer();
		}
		break;
	
	// Walk Left
	case(3):
		x += entityDirection == Dir.right? 2: -2;
		break;
		
	// Knockback
	case(6):
		if !getFlag(Entity_Flag.inAir) {setEntityState(11);}
		break;
		
	// Thunder Knockback
	case(30):
		y_speed = 0;
		if x == xprevious
		{
			setEntityState(11);
		}
		break;
}

// Inherit the parent event
event_inherited();