/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0): case(1):
		setAnimation(Sequence_king.idle);
		break;
		
	// Walk
	case(20):
	case(3):
		setAnimation(Sequence_king.walk);
		walkInDirection(2);
		break;
		
	// Knockback
	case(6):
		setAnimation(Sequence_king.hurt);
		x_speed = 2 * polarize(entityDirection == Dir.right);
		y_speed = -3;
		setFlag(Entity_Flag.inAir);
		break;
		
	// Walk (Slow)
	case(8):
		setAnimation(Sequence_king.walk);
		walkInDirection(2);
		break;
		
	case(11):
		setAnimation(Sequence_king.ko);
		break;
		
	// Jump
	case(10):
		setAnimation(Sequence_king.walk);
		y_speed = -3;
		walkInDirection(2);
		break;
		
	// Flying Back after being struck by thunder
	case(30):
		setAnimation(Sequence_king.hurt);
		x_speed = 2 * polarize(entityDirection == Dir.right);
		break;
}