/// @desc 

// Inherit the parent event
event_inherited();

flag = setBit(flag, 
	Entity_Flag.ignoreSolid, 
	Entity_Flag.solid,
	Entity_Flag.shootable
	)

init_entity_stats(10, 0, 0);

ystart -= UNIT_PX / 2;
y = ystart;