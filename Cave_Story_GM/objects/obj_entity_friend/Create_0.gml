/// @desc 

init_entity(32, 32, 16, 16, 
	setBit(0,
		Entity_Flag.interactable,
		), 
	LyrDepth.midEntities);
	
init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);