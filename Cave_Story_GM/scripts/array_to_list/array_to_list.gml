/// @desc Converts values (bytes) in a list to an array
/// @arg array,list
function array_to_list(argument0, argument1) {

	var _arr = argument0, _list = argument1,
	_l = array_length(_arr);

	ds_list_clear(_list);

	for (var i = 0; i < _l; i++)
	{
		_list[| i] = _arr[i];
	}

	return _list;


}
