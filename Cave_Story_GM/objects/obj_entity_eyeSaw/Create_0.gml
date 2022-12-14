/// @desc 

// Inherit the parent event
event_inherited();

init_entity(32, 32, 16, 16, 
	setBit(flag, 
		//Entity_Flag.shootable,
		//Entity_Flag.showDamage,
		Entity_Flag.invulnerable
		)
	);
	
init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);
init_entity_stats(16, 10, 8);

setEntityState(0);

sawAngle = irandom(360);
sawSpeed = 4;
movespeed = 5;
breakTimer = 0;

radius = 48;

targetInst = PLAYER;
target = list_create();