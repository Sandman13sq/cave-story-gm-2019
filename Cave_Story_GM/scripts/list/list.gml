/// @desc Returns list with given values
/// @arg *value1,*value2,*...
function list() {

	// BE SURE TO DELETE THESE LISTS WHEN LO LONGER NEEDED
	// THIS FUNCTION IS TOO POWERFUL FOR THE FEEBLE-MINDED

	var _list = list_create();

	for (var i = 0; i < argument_count; i++)
	{
		ds_list_add(_list, argument[i]);
	}

	return _list;


}
