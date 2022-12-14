/// @desc State Change 

// Inherit the parent event
event_inherited();

teleportX = 0;

switch(state)
{
	case(0):
		setAnimation(Sequence_misery.idle);
		break;
		
	// Float
	case(8):
		setAnimation(Sequence_misery.float);
		teleportX = 2;
		sfx_at(snd_teleport, MY_X, MY_Y, 0);
		break;
		
	// Float Up
	case(20):
		setAnimation(Sequence_misery.float);
		flag = setBit(flag, Entity_Flag.ignoreSolid);
		break;
		
	// Cast
	case(15):
		timer = 20;
		setAnimation(Sequence_misery.cast);
		break;
		
	// Drop
	case(13):
		setAnimation(Sequence_misery.float);
		break;
}