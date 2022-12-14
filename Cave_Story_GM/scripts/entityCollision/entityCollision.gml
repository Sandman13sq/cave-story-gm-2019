/// @desc Returns true if entity is in entity
/// @arg src_inst,target_inst
function entityCollision(argument0, argument1) {

	var _src = argument0, _des = argument1;

	with _src
	{
		return rectangle_in_rectangle(
			x + x_left, y + y_up,
			x + x_right, y + y_down,
			_des.x + _des.x_left, _des.y + _des.y_up,
			_des.x + _des.x_right, _des.y + _des.y_down,
			)
	}


}
