/// @desc State Change

switch(state)
{
	default:
		x_speed = 0;
		break;
		
	case(0): case(1): case(10):
		setAnimation(Sequence_player.idle);
		x_speed = 0;
		break;
		
	case(3):
		setAnimation(Sequence_player.run);
		walkInDirection(2);
		break;
		
	// Knockback
	case(30): break;
	case(5):
		setAnimation(Sequence_player.hurt);
		x_speed = 2 * polarize(nearestPlayer(MY_X, MY_Y).x < MY_X)
		y_speed = -4;
		break;
		
	// KO
	case(6):
		setAnimation(Sequence_player.knee);
		x_speed = 0;
		break;
}