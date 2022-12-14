/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(2):
		setAnimation(Sequence_mahin.idle);
		break;
		
	case(0):
		setAnimation(Sequence_mahin.eating);
		break;
}