/// @desc Returns if bit is set in array
/// @arg bit_array,bit_position
function get_arrayBit() {

	var _arr = argument[0], _index = argument[1], 
	_value = _arr[_index div NUMSIZE];

	//msg(_index, _index div NUMSIZE, _value);

	return bool(_value & 1 << (_index mod NUMSIZE))


}
