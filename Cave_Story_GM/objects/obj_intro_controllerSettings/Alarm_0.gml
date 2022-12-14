/// @desc Time until return

if showGpad
{
	var _inputObj = global.InputObj, 
	_s = Input.maskSize_gpad, _interval = 4;
	
	if inputDevice > -1
	{
		_inputObj.inputDevice = inputDevice;
	}
			
	switch(inputSelect)
	{
		case(0): case(1): case(2): case(3):
			_inputObj.inputMap_Dpad = setSubmask(_inputObj.inputMap_Dpad, 
				lastInput, _s * (inputSelect mod _interval), _s);
			break;
			
		case(4): case(5): case(6): case(7):
			_inputObj.inputMap_face = setSubmask(_inputObj.inputMap_face, 
				lastInput, _s * (inputSelect mod _interval), _s);
			break;
			
		case(8): case(9): case(10): case(11):
			_inputObj.inputMap_shoulder = setSubmask(_inputObj.inputMap_shoulder, 
				lastInput, _s * (inputSelect mod _interval), _s);
			break;
	}
}
else
{
	var _inputObj = global.InputObj, 
	_s = Input.maskSize_keys, _interval = 8;
	
	switch(inputSelect)
	{
		case(0): case(1): case(2): case(3):
		case(4): case(5): case(6): case(7):
			_inputObj.inputMap_keys = setSubmask(_inputObj.inputMap_keys, 
				lastInput, _s * (inputSelect mod _interval), _s);
			break;
			
		case(8): case(9): case(10): case(11):
			_inputObj.inputMap_keys2 = setSubmask(_inputObj.inputMap_keys2, 
				lastInput, _s * (inputSelect mod _interval), _s);
			break;
	}
}

event_user(0);

state = 1;