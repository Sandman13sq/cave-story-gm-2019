/// Returns number as binary string
/// @arg value,masklength
function bitmaskString() {

	var _value = argument[0], _maskLength = argument[1], 
	_str = "", _l = (NUMSIZE div _maskLength);

	for (var i = _l - 1; i >= 0; i--)
	//for (var i = 31; i >= 0; i--)
	{
		_str += string(_value >> (_maskLength * i) & (power(2, _maskLength) - 1))
		
		_str += " ";
	}

	return _str


}
