/// 
/// @arg scale,experience,factor
function dropExp_createExp() {

	var _exp = argument[1], _factor = argument[2];

	repeat( (_exp div _factor) )
	{
		with instance_create_depth(
			x + center_x, y + center_y, LyrDepth.frontEntities, obj_energy)
		{
			//set_scale(argument[0]);
			size = argument[0];
			experience = _factor;
			x_speed = random(3) - 1.5;
			y_speed = -random(2);
			rotation_speed *= -polarize( x_speed );
		}
	}

	return max( (_exp mod _factor), 0 );


}
