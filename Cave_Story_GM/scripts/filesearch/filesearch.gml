/// @desc Returns path for file if exists in any parent directory
/// @arg filename,path1,path2,...
function filesearch() {

	var _filename = argument[0], _path = "";

	for (var i = 1; i < argument_count; i++)
	{
		if file_exists(argument[1] + _filename)
		{
			_path = argument[1] + _filename;
			break;
		}
	}

	if _path == ""
	{
		if file_exists(_filename)
		{
			_path = _filename;
		}
	}

	return _path;


}
