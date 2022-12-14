/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Idle
	case(0):
		setAnimation(Sequence_balrog.idle);
		break;
		
	// Fall
	case(12):
		setAnimation(Sequence_balrog.jump);
		break;
}