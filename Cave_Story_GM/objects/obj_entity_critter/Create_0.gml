/// @desc 

event_inherited();

init_entity(32, 32, 16, 16, 
	setBit(0, 
		Entity_Flag.facingRight, 
		Entity_Flag.shootable, 
		Entity_Flag.showDamage,
		)
	);

init_entity_stats(4, 1, 3);
init_entity_deathData(
	snd_hurtSmall, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.medium);
	
init_entity_movement(0, 0, 0.3, 6);

initAnimation(Animation_Group.critter, setBit(0, Animation_Flag.keepSprite) );

speed_theta = 0;
amplitude = UNIT_PX * 2;
period = timeToFrames(0, 2); // In Frames

look_range = 192; 
jump_range = 96;
jump_time = 20;
jump_step = 0;
jump_height = 6;

state = 0;