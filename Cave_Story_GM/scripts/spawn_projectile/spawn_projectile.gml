/// Creates projectile
/// @arg obj,x,y,source
function spawn_projectile() {

	var _ret = instance_create_depth(argument[1], argument[2], depth + 1, argument[0]);

	with _ret
	{
		sourceObj = argument[3];
	}

	return _ret;


}
