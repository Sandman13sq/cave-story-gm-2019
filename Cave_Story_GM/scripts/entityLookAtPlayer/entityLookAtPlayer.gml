/// @desc Sets direction to look at player
/// @arg *range
function entityLookAtPlayer() {

	var _inst = nearestPlayer(MY_X, MY_Y), _canLook = true;

	if _inst
	{
		if argument_count > 0
		{
			_canLook = point_in_rectangle(
				_inst.x, _inst.y,
				MY_X - argument[0], y + y_up - UNIT_PX,
				MY_X + argument[0], y + y_down
				);
		}

		if _canLook
		{
			if (_inst.x + _inst.center_x) > x + center_x
			{
				setEntityDirection(Dir.right);
			}
			else
			{
				setEntityDirection(Dir.left);
			}
		}
	}


}
