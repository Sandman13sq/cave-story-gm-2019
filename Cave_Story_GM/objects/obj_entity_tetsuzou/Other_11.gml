/// @desc State Change 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_tetsuzou.idle);
		break;
		
	case(1):
		setAnimation(Sequence_tetsuzou.sleep);
		break;
}