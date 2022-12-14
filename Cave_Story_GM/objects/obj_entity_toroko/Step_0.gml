/// @desc 

switch(state)
{
	/*
	// Look at Player
	case(0):
		var _x = x + center_x, _y = y + UNIT_PX, _w = 64, _h = UNIT_PX;
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
		{
			if collision_rectangle(_x - _w, _y - _h, _x + _w, _y, PLAYER, false, true)
			entityLookAtPlayer();
		}
		break;
	*/
	
	// Running
	case(3):
	case(4):
		if getBit_multi(collisionDirection, Dir.right, Dir.left)
		{
			flipEntityDirection();
			walkInDirection(4);
		}
		break;
		
	case(5):
		
		break;
		
	// Jumping
	case(6):
		if !getFlag(Entity_Flag.inAir) {setEntityState(4)}
		break;
}

// Inherit the parent event
event_inherited();