/// @desc 

event_inherited();

init_entity(64, 48, 32, 24, 
	setBit(flag,
		Entity_Flag.showDamage, 
		Entity_Flag.shootable,
		Entity_Flag.bouncy
		)
	);
	
init_entity_stats(7, 2, 7);

init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);

init_entity_deathData(
	snd_hurtBig, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.medium);

initAnimation(Animation_Group.behemoth);

stunTimer = 0;
stunDuration = 60;
stunHits = 0;

chargeTimer = 0;

walkSpeed = 1;
chargeSpeed = 3;

setEntityDirection(Dir.right);
setEntityState(0);