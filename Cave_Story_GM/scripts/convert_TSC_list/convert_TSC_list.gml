/// @desc Returns string from TSC file
/// @arg filename
function convert_TSC_list() {

	var _file = file_bin_open(argument[0], 0), _str = "",
	_byteOffset = file_bin_seek(_file, floor(file_bin_size(_file) / 2) );

	_str = file_bin_toString_bump(_file, _byteOffset);
	//msg(_str)

	file_bin_close(_file);

	return _str;


}
