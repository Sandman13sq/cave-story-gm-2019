/// @desc Returns map name from value
/// @arg mapIndex
function get_classic_map() {

	var _file = file_bin_open(file_dir_string(DATADIR, DATANAME) + "_classic.pxp", 0),
	_str = "", _pos = (0xC8 * argument[0]) + 0x20, _chr = "";

	file_bin_seek(_file, _pos);
	
	repeat(0x20) 
	{
		_chr = file_bin_read_byte(_file);
		if _chr >= 32
		{
			_str += chr(_chr);
		}
	}

	file_bin_close(_file);
	//msg(argument[0], _str)
	return _str;


}
