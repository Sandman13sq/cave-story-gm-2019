/// @desc 

// Inherit the parent event
event_inherited();

flag = setBit(flag, 
	Entity_Flag.ignoreSolid, 
	Entity_Flag.solid,
	//Entity_Flag.invulnerable
	)

init_entity_stats(10, 0, 0);