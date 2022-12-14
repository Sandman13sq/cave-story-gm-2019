/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_jack.idle);
		break;
		
	case(8):
		setAnimation(Sequence_jack.walk);
		walkInDirection(2);
		break;
}