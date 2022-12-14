/// Returns value of array in the xth dimension
/// @arg, array,index1,index2...
function array_xd() {

	var _arr = argument[0], i;

	for (i = 1; i < argument_count; i++)
	{
		_arr = _arr[argument[i]];
	}

	return _arr


}
