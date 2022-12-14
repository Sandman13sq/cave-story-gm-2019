/// @desc Wraps Value (Keeps value within range of min and max)
/// @arg value,min,limit
function loop() {

	// Interval: [min, limit)

	var _value = argument[0],
	_min = argument[1], _max = argument[2],
	_diff = _max - _min;

	if _value >= _max
	{
		while _value >= _max
		{
			_value -= _diff;
		}
	}
	else if _value < _min
	{
		while _value < _min
		{
			_value += _diff;
		}
	}

	return _value;


}
