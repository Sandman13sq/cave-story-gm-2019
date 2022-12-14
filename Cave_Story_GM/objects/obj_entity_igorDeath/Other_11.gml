/// @desc 

// Inherit the parent event
event_inherited();

x_speed = 0;

switch(state)
{
	// Hurt
	case(0):
		timer = 60;
		shakeTimer = -1;
		clearFlag(Entity_Flag.solid, Entity_Flag.showDamage, Entity_Flag.shootable);
		setAnimation(Sequence_igor.hurt);
		break;
		
	// Transforming
	case(1):
		timer = 100;
		setAnimation(Sequence_igor.transform);
		break;
		
	// Fall Over
	case(2):
		setAnimation(Sequence_igor.fallOver);
		shakeEntity(false);
		animationSpeed = 1;
		break;
}