/// @desc 

// Inherit the parent event
event_inherited();

timer--;

if timer <= 0
{
	timer = 5 + irandom(200);
	
	part_particles_create(PART_SYS_BACK, 
		x + 4 + irandom(UNIT_PX - 8), y,
		getPartType(Part_Index.waterDroplet), 1);
}