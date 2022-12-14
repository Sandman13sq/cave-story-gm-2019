/// @desc 

// Inherit the parent event
event_inherited();

flag = setBit(flag, 
	Entity_Flag.shootable, 
	Entity_Flag.showDamage,
	Entity_Flag.solid,
	);
	
init_entity_deathData(
	snd_squeal, getPartType(Part_Index.shotCircle), 
	snd_explosionSmall, Death_Cloud.small
	);
	
init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);

init_entity_stats(2, 1, 0);
	
initAnimation(Animation_Group.pignon);

timer = 0;
hurtTowards = false;

setEntityState(0);