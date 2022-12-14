/// @desc Writes byte to file
/// @arg file,byte0,byte1,...
function byteWrite_byte() {

	var _file = argument[0], _l = argument_count;

	for (var i = 1; i < _l; i++)
	{
		file_bin_write_byte(_file, argument[i]);
	}

	return 1;


}
