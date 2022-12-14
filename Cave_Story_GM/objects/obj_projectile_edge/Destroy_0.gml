/// @desc Shot Spark

// Inherit the parent event
event_inherited();

// Shot Spark if no enemy was hit
if life == 0
{
	part_particles_create(PART_SYS_FRONT, 
		x + lengthdir_x(radius, direction),
		y + lengthdir_y(radius, direction),
		getPartType(Part_Index.shotSpark), 1);
}

part_particles_create_color(PART_SYS_FRONT, 
	x + lengthdir_x(radius, direction),
	y + lengthdir_y(radius, direction),
	getPartType(Part_Index.debris_pStar), color, irandom(4) + radius div 4);
	
part_particles_create_color(PART_SYS_FRONT, 
	x + lengthdir_x(radius, direction),
	y + lengthdir_y(radius, direction),
	getPartType(Part_Index.debris_pStar), Col.onyxPink, irandom(2) + radius div 4);
	
part_particles_create_color(PART_SYS_FRONT, 
	x + lengthdir_x(radius, direction),
	y + lengthdir_y(radius, direction),
	getPartType(Part_Index.debris_pStar), Col.onyxBlue, irandom(2) + radius div 4);