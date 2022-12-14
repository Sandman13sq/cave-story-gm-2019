/// @desc
function input_manage() {

	if inputDevice == -1
	{
		if gamepad_get_device() > -1
		{
			inputDevice = gamepad_get_device();
		}
	}

	if global.inputBuffer_alarm > 0
	{
		global.inputBuffer_alarm--;
	
		if global.inputBuffer_alarm == 0
		{
			global.inputBuffer_button = 0;
		}
	}

	var _inputLast = global.inputFlag, i = 0, _device = inputDevice;

	global.inputFlag = 0;

	for (var i = 0; i < 4; i++)
	{
		if !( global.inputFlag_locked & (1 << i) )
		{
			if	keyboard_check( (inputMap_keys >> (i * Input.maskSize_keys) ) & Input.fullMask_keys )
			||	gamepad_button_check( _device, (inputMap_Dpad >> (i * Input.maskSize_gpad) ) & Input.fullMask_gpad )
			||	_input_check_gp_axis( _device, 0, i)
			{
				global.inputFlag = global.inputFlag | 1 << i;
			}
		}
	}

	for (var i = 4; i < 8; i++)
	{
		if !( global.inputFlag_locked & (1 << i) )
		{
			if	keyboard_check( (inputMap_keys >> (i * Input.maskSize_keys) ) & Input.fullMask_keys )
			||	gamepad_button_check( _device, (inputMap_face >> ((i - 4) * Input.maskSize_gpad) ) & Input.fullMask_gpad )
			{
				global.inputFlag = global.inputFlag | 1 << i;
			}
		}
	}

	for (var i = 8; i < 12; i++)
	{
		if !( global.inputFlag_locked & (1 << i) )
		{
			if	keyboard_check( (inputMap_keys2 >> ((i - 8) * Input.maskSize_keys) ) & Input.fullMask_keys )
			||	gamepad_button_check( _device, (inputMap_shoulder >> ((i - 8) * Input.maskSize_gpad) ) & Input.fullMask_gpad )
			{
				global.inputFlag = global.inputFlag | 1 << i;
			}
		}
	}

	global.inputFlag_pressed = ( global.inputFlag & ~_inputLast ) & ~global.inputFlag_locked;
	global.inputFlag_released = ( ~global.inputFlag & _inputLast ) & ~global.inputFlag_locked;

	if global.inputFlag_pressed
	{
		global.inputBuffer_alarm = inputBuffer_time;
		global.inputBuffer_button = global.inputFlag_pressed;
	}


}
