/// @desc Returns string from text file in temp directory
/// @arg tempfilepath
function getTempString(argument0) {

	var _file = file_text_open_read(temp_directory + argument0), _str = "";

	while (!file_text_eof(_file))
	{
		_str += file_text_readln(_file);
	}

	file_text_close(_file);

	return _str;


}
