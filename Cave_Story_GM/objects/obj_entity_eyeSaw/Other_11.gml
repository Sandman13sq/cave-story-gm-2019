/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		
		break;
		
	case(1):
		breakTimer = 70;
		break;
		
	case(2):
		walkInDirection(-1);
		y_speed = -4;
		break;
		
	case(3):
		walkInDirection(movespeed);
		y_speed = 0;
		break;
}