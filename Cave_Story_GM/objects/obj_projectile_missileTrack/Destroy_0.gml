/// @desc 

// Inherit the parent event
event_inherited();

part_particles_create(PART_SYS_FRONT, 
	x + dcos(direction) * sprite_get_width(sprite_index) / 2, 
	y - dsin(direction) * sprite_get_height(sprite_index) / 2, 
	getPartType(Part_Index.shotSpark), 1);

part_particles_create_region(PART_SYS_FRONT, 
	x - nextRadius, y - nextRadius,
	x + nextRadius, y + nextRadius,
	getPartType(Part_Index.poof), 4);

spawn_radius(x, y, nextRadius, nextDamage);

sfxCut_at(snd_missileHit, x, y, 0);