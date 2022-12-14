/// @desc Converts values (bytes) in a list to an array
/// @arg list,*final,*start,
function ds_list_to_array() {

	var _list = argument[0], _arr = array_create(0, 0), 
	_start = 0, _final = ds_list_size(_list) - 1, _index = 0;

	if argument_count >= 2 {_final = argument[1]}
	if argument_count >= 3 {_start = argument[2]}

	_index = _final - _start;

	for (var i = _final; i >= _start; i--)
	{
		_arr[_index] = _list[| i];
		_index--;
	}

	return _arr;


}
