/// @desc 

event_inherited();

init_entity(32, 32, 16, 16, 
	setBit(0, 
		Entity_Flag.facingRight, 
		Entity_Flag.shootable, 
		Entity_Flag.trackPlayer,
		Entity_Flag.showDamage,
		)
	);

init_entity_stats(6, 1, 3);
init_entity_deathData(
	snd_hurtSmall, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.medium);
	
initAnimation(Animation_Group.bat);
setAnimation(Sequence_bat.air);

amplitude = UNIT_PX * 2;
period = timeToFrames(0, 4); // In Frames
speed_theta = irandom(period);