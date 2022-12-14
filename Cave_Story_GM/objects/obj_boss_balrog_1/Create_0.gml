/// @desc 

// Inherit the parent event
event_inherited();

init_entity(32, 48, 32, 24, 
	setBit(flag, 
		Entity_Flag.shootable,
		Entity_Flag.showDamage,
		)
	);
	
init_entity_dimensions(-16, 0, 48, 48);
	
init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);
init_entity_stats(80, 2, 0);
initAnimation(Animation_Group.balrog);

timer = 0;
jumpState = 0;
	
setEntityState(0);