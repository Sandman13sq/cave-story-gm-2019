/// @desc 

switch(state)
{
	// Look
	case(0):
		entityLookAtPlayer();
		break;
		
	// Snore
	case(1):
		if snoreStep <= 0
		{
			part_particles_create(PART_SYS_MID, MY_X, MY_Y,
				getPartType(Part_Index.snore), 1
				);
				
			snoreStep = irandom_range(80, 120);
		}
		else {snoreStep--;}
		break;
}

// Inherit the parent event
event_inherited();