/// @desc 

// Inherit the parent event
event_inherited();

x_speed = 0;

switch(state)
{
	// Idle
	case(0):
		setAnimation(Sequence_pignon.idle);
		timer = 100 + irandom(40);
		break;
		
	// Walking
	case(1):
		setAnimation(Sequence_pignon.walk);
		timer = 30 + irandom(40);
		walkInDirection(1);
		break;
		
	// Hurt
	case(2):
		setAnimation(Sequence_pignon.hurt);
		x_speed = polarize(MY_X > (PLAYER.x + PLAYER.center_x)) * polarize(!hurtTowards);
		y_speed = -2;
		setFlag(Entity_Flag.inAir);
		break;
}