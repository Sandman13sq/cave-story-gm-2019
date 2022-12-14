/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	// Follow Player
	case(1):
		init_entity_stats(10, 2, 5);
		
		setAnimation(Sequence_basu.fly);
		
		flag = setBit(flag,
			Entity_Flag.showDamage, 
			Entity_Flag.shootable,
			Entity_Flag.ignoreSolid
			);
			
		visible = true;
		break;
}