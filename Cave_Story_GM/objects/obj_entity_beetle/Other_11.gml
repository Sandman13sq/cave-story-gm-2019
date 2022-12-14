/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	// Hanging on wall
	case(0):
		setAnimation(Sequence_beetle.idle);
		break;
		
	// Fly to next wall
	case(1):
		setAnimation(Sequence_beetle.flying);
		break;
}