/// @desc
/// @arg part_sys,x1,y1,x2,y2,part_type,number,color
function part_particles_create_color_region() {

	repeat(argument[6])
	{
		part_particles_create_color(argument[0], 
			argument[1] + irandom(argument[3] - argument[1]),
			argument[2] + irandom(argument[4] - argument[2]),
			argument[5], argument[7], 1)
	}


}
