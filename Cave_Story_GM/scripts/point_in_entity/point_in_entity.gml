/// @desc Returns true if point is in entity
/// @arg x,y,entityInst
function point_in_entity(argument0, argument1, argument2) {

	var _ret = -1;

	if instance_exists(argument2)
	{
		with argument2
		{
			_ret = point_in_rectangle(
				argument0, argument1,
				x + x_left, y + y_up,
				x + x_right, y + y_down
				);
		}
	}

	return _ret;


}
