/// @desc Returns a string to use for directories
/// @arg dir1,dir2,...
function file_dir_string() {
	var _str = "";

	for (var i = 0; i < argument_count; i++)
	{
		_str += argument[i] + "/";
	}

	return _str;


}
