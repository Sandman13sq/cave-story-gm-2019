/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	// Follow Player
	case(1):
		init_entity_stats(4, 1, 2);
		
		setAnimation(Sequence_beetle.flyingDark);
		
		flag = setBit(flag,
			Entity_Flag.showDamage, 
			Entity_Flag.shootable,
			Entity_Flag.solid,
			Entity_Flag.ignoreSolid
			)
		visible = true;
		break;
}