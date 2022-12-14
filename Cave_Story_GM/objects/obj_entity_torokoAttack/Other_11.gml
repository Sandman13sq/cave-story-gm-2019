/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(10):
		setAnimation(Sequence_toroko.ko);
		break;
	
	// Hurt
	case(11):
		setAnimation(Sequence_toroko.ko);
		flag = setBit(flag, Entity_Flag.interactable);
		//sfx_at(snd_squeal, x, y, 0);
		attackPower = 0;
		y_speed = -3;
		setFlag(Entity_Flag.inAir);
		x_speed = polarize(entityDirection == Dir.right);
		break;
		
	case(12):
		setEntityDirection(Dir.right)
		y_speed = -3;
		setFlag(Entity_Flag.inAir);
		x_speed = 3;
		timer = 40;
		setAnimation(Sequence_toroko.run);
		break;
}