/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Off
	case(0):
		part_particles_create(
			PART_SYS_MID, MY_X, MY_Y, 
			getPartType(Part_Index.waterSprinkler), 1
			);
		break;
		
	// Off
	case(1):
		
		break;
}