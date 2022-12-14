/// @desc Sets bit in array of bits
/// @arg bit_array,bit_position,clear?
function set_arrayBit() {

	// Changes array directly, No need to return

	var _arr = argument[0], _index = argument[1], 
	_clear = argument[2] > 0, _value = _arr[ _index div NUMSIZE ];

	if _clear
	{
		_value = _value & ~(1 << (_index mod NUMSIZE) );
	}
	else
	{
		_value = _value | 1 <<  (_index mod NUMSIZE) ;
	}

	_arr[@ _index div NUMSIZE] = _value;
	// NO RETURN


}
