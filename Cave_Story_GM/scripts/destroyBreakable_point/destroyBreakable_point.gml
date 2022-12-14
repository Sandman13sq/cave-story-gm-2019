/// @desc Destroys breakable at point if present
/// @arg x,y
function destroyBreakable_point(argument0, argument1) {

	var _breakable = collision_circle(argument0, argument1, 1, obj_breakable, false, true);
		
	if _breakable
	{
		instance_destroy(_breakable);
	};

	return _breakable;


}
