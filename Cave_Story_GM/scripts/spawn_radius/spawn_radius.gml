/// @desc Creates a radius for damage
/// @arg x,y,radius,damage
function spawn_radius() {

	var _inst = instance_create_depth(argument[0], argument[1], 
		LyrDepth.frontEntities, obj_projectile_radius)

	with _inst
	{
		radius = argument[2];
		damage = argument[3];
	}

	return _inst;


}
