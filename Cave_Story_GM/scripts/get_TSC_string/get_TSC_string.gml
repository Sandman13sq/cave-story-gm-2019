/// @desc Returns string from TSC file
/// @arg filepath
function get_TSC_string() {

	var _file = file_bin_open(argument[0], 0), _str = "",
	_byteOffset = 0, _size;

	if _file
	{
		_size = file_bin_size(_file);
		file_bin_seek(_file, floor(_size / 2));
		_byteOffset = file_bin_read_byte(_file);
	
		file_bin_seek(_file, 0);
	
		for (var i = 0; i < _size; i++)
		{
			if i == floor(_size / 2)
			{
				_str += chr(file_bin_read_byte(_file));
			}
			else
			{
				_str += chr(file_bin_read_byte(_file) - _byteOffset);
			}
		}

		file_bin_close(_file);
	}

	return _str;


}
