/// @desc 

state = true;
runEvent(0040);
sfx(snd_playerDeath);

part_particles_create_region_wh(PART_SYS_FOREGROUND, x + center_x, y + center_y, 
	UNIT_PX, UNIT_PX, getPartType(Part_Index.poof), 8);