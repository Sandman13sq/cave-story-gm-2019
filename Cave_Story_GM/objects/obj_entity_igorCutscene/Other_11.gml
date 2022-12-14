/// @desc 

// Inherit the parent event
event_inherited();

x_speed = 0;

switch(state)
{
	default:
		setAnimation(Sequence_igor.idle);
		break;
		
	// Walk
	case(2):
		setAnimation(Sequence_igor.walk);
		walkInDirection(2);
		break;
		
	// Punch
	case(4):
		setAnimation(Sequence_igor.hit, true);
		break;
}