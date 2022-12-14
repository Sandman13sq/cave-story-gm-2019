/// @desc State Change 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_misery.idle);
		break;
		
	// Cast
	case(30):
		setAnimation(Sequence_misery.cast);
		break;
		
	// Float Up
	case(20):
		setAnimation(Sequence_misery.float);
		flag = setBit(flag, Entity_Flag.ignoreSolid);
		break;
}