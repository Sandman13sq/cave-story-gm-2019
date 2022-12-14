/// @desc 

// Inherit the parent event
event_inherited();

part_particles_create_region(
	PART_SYS_MID, 
	x - radius, y - radius, 
	x + radius, y + radius,
	getPartType(Part_Index.debris_pStar), 10
	);
	
sfxCut_at( snd_shotHit, MY_X, MY_Y, 0, false);