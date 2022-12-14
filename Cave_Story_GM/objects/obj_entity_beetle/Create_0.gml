/// @desc 

// Inherit the parent event
event_inherited();

init_entity(32, 32, 16, 16, 
	setBit(flag,
		Entity_Flag.showDamage, 
		Entity_Flag.shootable,
		)
	);
	
init_entity_stats(4, 1, 2);
init_entity_deathData(
	snd_hurtSmall, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.medium
	);
	
initAnimation(Animation_Group.beetle);

timer = 60;
max_speed = 3;