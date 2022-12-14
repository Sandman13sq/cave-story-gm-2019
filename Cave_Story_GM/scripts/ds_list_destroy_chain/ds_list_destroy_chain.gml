/// @desc Deletes ds lists within ds lists
/// @arg list,depth
function ds_list_destroy_chain(argument0, argument1) {

	// Depth is the max number of lists to be found (Not including the initial list)

	var _list = argument0;

	if ds_exists(_list, ds_type_list)
	{
		var _l = ds_list_size(_list),
		_depth = argument1;

		if _depth > 1
		{
			for (var i = 0; i < _l; i++)
			{
				if ds_exists(_list[| i], ds_type_list)
				{
					ds_list_destroy_chain(_list[| i], _depth - 1);
				}
			}
		}

		list_free(_list);
	}


}
