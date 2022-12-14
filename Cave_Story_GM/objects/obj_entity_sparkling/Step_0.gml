/// @desc 

if FREEZE {exit}; // Don't Run code if frozen

// Inherit the parent event
event_inherited();

if irandom(6) == 0
{
	part_particles_create_region(PART_SYS_MID,
		x, y, x + width, y + height, 
		getPartType(Part_Index.twinkle), 1);
}

theta = loop(theta + thetaSpeed, 0, 360);
radius = (max(width, height) / 3) + dsin(theta) * 2;

drawX = x + width / 2;
drawY = y + height / 2;