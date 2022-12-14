//// @desc Returns index of device, -1 if none is found
function gamepad_get_device() {

	var _ret = -1;

	for (var i = 0; i <= 11; i++)
	{
		if gamepad_any_pressed(i)
		{
			_ret = i;
			break;
		}
	}

	return _ret;


}
