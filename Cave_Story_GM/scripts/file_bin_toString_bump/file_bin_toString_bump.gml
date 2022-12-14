/// @desc Converts file data to string and offsets byte vaule
/// @arg file,valueBump
function file_bin_toString_bump() {

	var _str = "", _file = argument[0], _byte = 0, _l = file_bin_size(_file);

	file_bin_seek(_file, 0);

	for (var i = 0; i < _l; i++)
	{
		_byte = file_bin_read_byte(_file) + argument[1];
		_str += chr( _byte );
	}

	return _str;


}
