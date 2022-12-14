/// @desc 

init_entity(32, 32, 16, 16,
	setBit(0, 
		Entity_Flag.invulnerable, 
		Entity_Flag.solid, 
		Entity_Flag.shootable)
	);

init_entity_stats(0, 1, 0);
init_entity_dimensions(
	8, 0, UNIT_PX - 8, UNIT_PX
	);