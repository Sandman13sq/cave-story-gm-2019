/// @desc Updates variable according to input
/// @arg value,min,max,wrap?
function navigate_selection() {

	var _value = argument[0],
	_min = argument[1], _max = argument[2],
	_wrap = argument[3];

	// Increment Value
	if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
	{
		_value++;
	
		// Wrap Value
		if _wrap {_value = _value > _max? _min: _value}
		// Clamp Value
		else {_value = _value > _max? _max: _value}
	}

	// Decrement Value
	if INPUT_LEFT_PRESSED || INPUT_UP_PRESSED
	{
		_value--;
	
		// Wrap Value
		if _wrap {_value = _value < _min? _max: _value}
		// Clamp Value
		else {_value = _value < _min? _min: _value}
	}

	return _value;


}
