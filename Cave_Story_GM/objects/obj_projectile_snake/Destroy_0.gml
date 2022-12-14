/// @desc 

// Inherit the parent event
event_inherited();

if life == 0
{
	part_particles_create(PART_SYS_FRONT, 
		x, 
		y, 
		getPartType(Part_Index.shotSpark), 1);
}

part_particles_create_color_region(PART_SYS_FRONT, 
	x - radius, y - radius,
	x + radius, y + radius,
	getPartType(Part_Index.debris_pStar), irandom(4) + radius div 4,
	color);