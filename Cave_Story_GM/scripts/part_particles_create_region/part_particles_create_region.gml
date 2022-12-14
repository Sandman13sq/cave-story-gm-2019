/// @desc
/// @arg part_sys,x1,y1,x2,y2,part_type,number
function part_particles_create_region(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	repeat(argument6)
	{
		part_particles_create(argument0, 
			argument1 + irandom(argument3 - argument1),
			argument2 + irandom(argument4 - argument2),
			argument5, 1)
	}


}
