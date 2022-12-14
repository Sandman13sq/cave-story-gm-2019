/// Return array with given values in order
/// @arg value1,value2,...
function array_create_val() {

	var _arr, i;

	for (var i = argument_count-1; i >= 0 ; i--)
	{
		_arr[i] = argument[i];
	}

	return _arr


}
