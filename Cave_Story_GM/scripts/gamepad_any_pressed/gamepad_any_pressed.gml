//// @desc Returns index of button on gamepad is pressed
/// @arg device
function gamepad_any_pressed(argument0) {

	var _ret = 0;

	// NOTE: Sticks are NOT included in this check

	for (var i = gp_face1; i <= gp_axisrv; i++)
	{
		if gamepad_button_check_pressed(argument0, i)
		{
			_ret = i;
			break;
		}
	}

	return _ret;


}
