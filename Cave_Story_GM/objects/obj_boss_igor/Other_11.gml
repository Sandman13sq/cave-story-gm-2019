/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	default:
		setAnimation(Sequence_igor.idle);
		x_speed = 0;
		timer = 60;
		entityLookAtPlayer();
		break;
		
	// Walk
	case(Igor_State.walk):
		setAnimation(Sequence_igor.walk);
		walkInDirection(2);
		timer = 60;
		entityLookAtPlayer();
		break;
		
	// Jump
	case(Igor_State.jump):
		setAnimation(Sequence_igor.jump);
		jumpWithSpeed(3);
		break;
		
	// Landing 
	case(Igor_State.land):
		setAnimation(Sequence_igor.squat);
		timer = 50;
		x_speed = 0;
		shakeScreen(4, 2);
		part_particles_create_region(
			PART_SYS_MAIN, 
			x + x_left, y + y_down,
			x + x_right, y + y_down,
			getPartType(Part_Index.poof), 3
			);
		sfx_at(snd_quake, MY_X, MY_Y, 0, false);
		break;
		
	// Charging
	case(Igor_State.charge):
		entityLookAtPlayer();
		setAnimation(Sequence_igor.charge);
		timer = 70;
		break;
		
	// Firing
	case(Igor_State.fire):
		setAnimation(Sequence_igor.fire);
		timer = 80;
		break;
		
	// Attacking
	case(Igor_State.punch):
		setAnimation(Sequence_igor.hit);
		timer = 60;
		x_speed = 0;
		break;
}