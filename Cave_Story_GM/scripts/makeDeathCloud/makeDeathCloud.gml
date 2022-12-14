/// @desc Creates death cloud
/// @arg size
function makeDeathCloud(argument0) {

	enum Death_Cloud
	{
		none,
		small = 1,
		medium = 2,
		large = 3
	}

	switch(argument0)
	{
		// Small
		case(Death_Cloud.small):
			part_particles_create(PART_SYS_PLAYER,
				x + center_x, 
				y + center_y, 
				getPartType(Part_Index.poof_still), 1
				);
			break;
		
		// Medium
		case(Death_Cloud.medium):
			part_particles_create_region(PART_SYS_PLAYER,
				x + x_left, y + y_up, 
				x + x_right, y + y_down,
				getPartType(Part_Index.poof), 3
				);
			break;
		
		// Large
		case(Death_Cloud.large):
			part_particles_create_region(PART_SYS_PLAYER,
				x + x_left, y + y_up, 
				x + x_right, y + y_down,
				getPartType(Part_Index.poof), 7
				);
			break;
	}


}
