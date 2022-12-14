/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	// Walk
	case(0):
		setAnimation(Sequence_behemoth.walk);
		walkInDirection(walkSpeed);
		setEntityDirection(x_speed > 0? Dir.right: Dir.left);
		break;
		
	// Stun
	case(1):
		setAnimation(Sequence_behemoth.hurt);
		x_speed = 0;
		stunTimer = stunDuration;
		break;
		
	// Walk
	case(2):
		setAnimation(Sequence_behemoth.charge);
		walkInDirection(chargeSpeed);
		break;
}