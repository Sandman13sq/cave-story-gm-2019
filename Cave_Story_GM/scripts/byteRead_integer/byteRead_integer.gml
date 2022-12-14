/// @desc Reads line of bytes as real
/// @arg file,byteSize,read_backwards?
function byteRead_integer(argument0, argument1, argument2) {

	var _file = argument0, _l = argument1,
	_value = 0;

	// Read backwards (Little Endian)
	if argument2
	{
		for (var i = _l - 1; i >= 0; i--)
		{
			_value += ( file_bin_read_byte(_file) * power(0x100, i) );
		}
	}
	// Read Forwards (Big Endian)
	else
	{
		for (var i = 0; i < _l; i++)
		{
			//if file_bin_position(_file) > file_bin_size(_file) {break;}
			_value += ( file_bin_read_byte(_file) * power(0x100, i) );
		}
	}

	//msg(_value)

	return _value;


}
