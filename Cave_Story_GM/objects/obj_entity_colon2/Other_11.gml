/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_colon.idle);
		break;
		
	case(3):
		setAnimation(Sequence_colon.walk);
		walkInDirection(2);
		break;
		
	case(12):
		setAnimation(Sequence_colon.search);
		break;
		
	case(10):
		setAnimation(Sequence_colon.ko);
		break;
}