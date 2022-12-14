/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_toroko.idle);
		break;
		
	case(3):
	case(4):
		walkInDirection(4);
		setAnimation(Sequence_toroko.run);
		break;
	
	// Jump / Run away
	case(6):
	case(8):
		if entityDirection == Dir.right
		{
			y_speed = -3;
			walkInDirection(1);
			setFlag(Entity_Flag.inAir);
			setAnimation(Sequence_toroko.run);
		}
		else
		{
			y_speed = -3;
			state = 5;
		}
		break;
		
	case(11):
		setAnimation(Sequence_toroko.ko);
		break;
		
	case(12):
		y_speed = -3;
		setFlag(Entity_Flag.inAir);
		x_speed = 3;
		timer = 5;
		setAnimation(Sequence_toroko.run);
		break;
}