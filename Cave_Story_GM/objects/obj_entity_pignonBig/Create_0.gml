/// @desc 

// Inherit the parent event
event_inherited();

init_entity_stats(12, 2, 0);

init_entity_deathData(
	snd_hurtBig, getPartType(Part_Index.shotCircle), 
	snd_explosion1, Death_Cloud.medium
	);
	
hurtTowards = true;