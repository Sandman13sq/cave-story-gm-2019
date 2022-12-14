/// @desc 

// Inherit the parent event
event_inherited();

init_entity(32, 32, 0, 0,
	setBit(0, Entity_Flag.shootable)
	);
	
init_entity_stats(2, 0, 10);

init_entity_deathData(0, 0, snd_explosion3, Death_Cloud.medium);

initAnimation(Animation_Group.capsule);

setAnimation(Sequence_capsule.energyCapsule);