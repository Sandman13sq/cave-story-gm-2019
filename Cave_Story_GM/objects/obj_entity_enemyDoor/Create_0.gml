/// @desc 

init_entity(UNIT_PX, UNIT_PX, 16, 24,
	setBit(0, Entity_Flag.shootable, Entity_Flag.showDamage),
	LyrDepth.backEntities);

init_entity_stats(10, 3, 10);

init_entity_deathData(
	snd_hurtBig, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.medium);
	
initAnimation(Animation_Group.door);

setEntityDirection(Dir.left);