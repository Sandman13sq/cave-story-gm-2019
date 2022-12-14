/// @desc 

switch(state)
{
	// Teleporting In
	case(0):
		y = ystart - 16;
		y_speed = 0;
		
		if timer {timer--}
		else
		{
			setEntityState(1);
		}
		
		teleportX = -teleportX;
		teleporting--;
		break;
		
	// Jump to Teleporter Pad
	case(1):
		if getBit(collisionDirection, Dir.down) {setEntityState(2);}
		break;
		
	// Teleporting Out
	case(2):
		
		break;
}

// Inherit the parent event
event_inherited();