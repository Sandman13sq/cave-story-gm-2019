/// @desc
/// @arg part_sys,x,y,w,h,part_type,number
function part_particles_create_region_wh() {

	repeat(argument[6])
	{
		part_particles_create(argument[0], 
			argument[1] + irandom(argument[3]),
			argument[2] + irandom(argument[4]),
			argument[5], 1)
	}


}
