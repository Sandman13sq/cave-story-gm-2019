/// @desc Swaps positions in ds list
/// @arg list,pos1,pos2 
function ds_list_swap_value(argument0, argument1, argument2) {

	// NOTE: Values at these positions CANNOT be "marked as"

	var _list = argument0, _pos1 = argument1, _pos2 = argument2,
	_temp = _list[| _pos2];

	// Replace second position with value at position 1
	ds_list_replace(_list, _pos2, _list[| _pos1]);

	// Replace first position with temp value
	ds_list_replace(_list, _pos1, _temp);

	return _list;


}
