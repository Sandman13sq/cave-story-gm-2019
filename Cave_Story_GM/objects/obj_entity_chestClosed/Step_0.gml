/// @desc 

// Inherit the parent event
event_inherited();

chest_theta = (chest_theta + 5) mod 360;
chest_shineAlpha = abs(power(dsin(chest_theta), 8));

if irandom(8) == 0
{
	part_particles_create_region(PART_SYS_FRONT,
		bbox_left, bbox_top, bbox_right, bbox_bottom, 
		getPartType(Part_Index.twinkle), 1);
}