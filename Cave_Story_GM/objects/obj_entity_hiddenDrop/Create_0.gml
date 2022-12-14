/// @desc 

event_inherited();

init_entity(UNIT_PX, UNIT_PX, UNIT_PX / 2, UNIT_PX / 2, 0);
	
flag = setBit(flag,
	Entity_Flag.shootable,
	);
	
init_entity_stats(2, 0, 0);

init_entity_deathData(
	snd_hurtSmall, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.small);