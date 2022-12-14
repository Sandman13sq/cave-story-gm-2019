/// @desc 

// Inherit the parent event
event_inherited();

flag = setBit(flag, 
	Entity_Flag.shootable, 
	Entity_Flag.showDamage,
	Entity_Flag.solid,
	);
	
init_entity_deathData(
	snd_hurtCool, getPartType(Part_Index.shotCircle), 
	snd_explosionSmall, Death_Cloud.medium
	);
	
init_entity_movement(0, 0, 0, 0);

init_entity_stats(2, 1, 0);
	
initAnimation(Animation_Group.chinfish);