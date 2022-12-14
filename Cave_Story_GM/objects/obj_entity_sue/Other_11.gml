/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0): setAnimation(Sequence_sue.idle); break;
	
	case(3): setAnimation(Sequence_sue.walk); break;
	
	case(5): setAnimation(Sequence_sue.search); break;
	
	case(6): 
		setAnimation(Sequence_sue.hit); 
		sfx_at( sfx_classic(Sound.squeal), MY_X, MY_Y, 0, false);
		sfx_at( sfx_classic(Sound.blockExplosion), MY_X, MY_Y, 0, false);
		break;
	
	case(8): 
		setAnimation(Sequence_sue.hit); 
		sfx_at( sfx_classic(Sound.squeal), MY_X, MY_Y, 0, false);
		sfx_at( sfx_classic(Sound.blockExplosion), MY_X, MY_Y, 0, false);
		x_speed = 3 * -polarize(entityDirection == Dir.right);
		y_speed = -2;
		flyStep = 0;
		break;
		
	case(10): 
		setAnimation(Sequence_sue.ko); 
		break;
	
	case(11): setAnimation(Sequence_sue.fighty); break;
	
	case(13): setAnimation(Sequence_sue.held); break;
}