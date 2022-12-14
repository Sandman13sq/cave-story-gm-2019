/// @desc Writes integer as bytes
/// @arg file,value,byteSize,write_backwards?
function byteWrite_integer(argument0, argument1, argument2, argument3) {

	var _file = argument0, _value = argument1,
	_l = argument2;

	// Write backwards (Little Endian)
	if argument3
	{
		for (var i = _l - 1; i >= 0; i--)
		{
			file_bin_write_byte( _file, ( _value >> (i * 8) ) & FullMask._8 );
		}
	}
	// Write Forwards (Big Endian)
	else
	{
		for (var i = 0; i < _l; i++)
		{
			file_bin_write_byte( _file, ( _value >> (i * 8) ) & FullMask._8 );
		}
	}

	return _l;


}
