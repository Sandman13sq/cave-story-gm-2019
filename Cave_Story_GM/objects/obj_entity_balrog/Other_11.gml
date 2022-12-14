/// @desc State Change

// Inherit the parent event
event_inherited();

teleportX = 0;

switch(state)
{
	case(0):
		setAnimation(Sequence_balrog.idle);
		break;
		
	// Blink
	case(12):
		setAnimation(Sequence_balrog.idle);
		break;
		
	// Crouch
	case(2):
		setAnimation(Sequence_balrog.crouch);
		break;
		
	// Crouch to Leap
	case(10):
	case(20):
		setAnimation(Sequence_balrog.crouch);
		jumpTimer = 40;
		flag = setBit(flag, Entity_Flag.ignoreSolid);
		break;
		
	// Smile
	case(30):
		setAnimation(Sequence_balrog.smile);
		smileTimer = 120;
		break;
		
	// Teleport
	case(70):
		setAnimation(Sequence_balrog.surprise);
		teleportX = 2;
		sfx_at(snd_teleport, MY_X, MY_Y, 0);
		break;
}