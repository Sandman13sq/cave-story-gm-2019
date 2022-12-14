/// @desc Reads line of bytes as string
/// @arg file
function byteRead_string(argument0) {

	var _file = argument0, _l = file_bin_read_byte(_file),
	_str = "";

	for (var i = 0; i < _l; i++)
	{
		_str += chr(byteRead_integer(_file, 2, true));
	}

	msg(_str)

	return _str;


}
