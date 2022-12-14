/// @desc Copies lists and lists in lists and returns new list
/// @arg source,list_depth
function ds_list_copy_chain(argument0, argument1) {

	var _dest = list_create(), 
	_source = argument0,
	_depth = argument1,
	_l = ds_list_size(_source);

	for (var i = 0; i < _l; i++)
	{
		// Recursive Case
		if _depth > 1
		{
			ds_list_add(_dest, ds_list_copy_chain(_source[| i], _depth - 1));
		}
	
		ds_list_copy(_dest, _source);
	}

	return _dest;


}
