/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	// Pause
	case(0):
		timer = 60;
		setAnimation(Sequence_balrog.idle);
		entityLookAtPlayer();
		break;
		
	// Walk
	case(1):
		timer = 60;
		setAnimation(Sequence_balrog.walk);
		jumpState++;
		break;
		
	// Jump
	case(2):
		timer = 60;
		setFlag(Entity_Flag.inAir);
		y_speed = -3;
		setAnimation(Sequence_balrog.jump);
		jumpState = 0;
		break;
}