/// @desc Missle Trail
part_particles_create(PART_SYS_MAIN, 
	x - dcos(direction) * sprite_get_width(sprite_index) / 2, 
	y + dsin(direction) * sprite_get_height(sprite_index) / 2, 
	getPartType(Part_Index.shotCircle_still), 1);
	
alarm[0] = 3;