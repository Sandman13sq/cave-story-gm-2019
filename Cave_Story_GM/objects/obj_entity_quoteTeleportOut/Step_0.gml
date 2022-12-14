/// @desc 

switch(state)
{
	// Look at Player
	case(0):
		if timer {timer--}
		else
		{
			setEntityState(1);
		}
		break;
		
	// Jump to Teleporter Pad
	case(1):
		if y_speed > 0
		{
			if y >= ystart - 16
			{
				y = ystart - 16;
				setEntityState(2);
			}
		}
		break;
		
	// Teleport Wait
	case(2):
		y = ystart - 16;
		y_speed = 0;
		
		if timer {timer--}
		else
		{
			setEntityState(3);
		}
		break;
		
	// Teleporting Out
	case(3):
		y = ystart - 16;
		y_speed = 0;
		
		teleportX = -teleportX;
		teleporting++;
		break;
}

// Inherit the parent event
event_inherited();