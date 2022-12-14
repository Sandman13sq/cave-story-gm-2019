/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_critter.idle); 
		x_speed = 0;
		break;
		
	case(1):
		setAnimation(Sequence_critter.look); 
		x_speed = 0;
		break;
		
	case(2):
		setAnimation(Sequence_critter.squat); 
		x_speed = 0;
		jump_step = jump_time;
		break;
		
	case(3):
		setAnimation(Sequence_critter.jump); 
		sfx_at(snd_critterJump, MY_X, MY_Y, 0);
		y_speed = -jump_height;
		x_speed = polarize(entityDirection == Dir.right);
		break;
}