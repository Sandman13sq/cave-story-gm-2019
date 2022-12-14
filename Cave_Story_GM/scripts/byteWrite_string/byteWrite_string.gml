/// @desc Writes string as bytes
/// @arg file,string
function byteWrite_string(argument0, argument1) {

	var _file = argument0,
	_str = argument1, 
	_l = string_length(_str), _chr;

	// Write Length
	file_bin_write_byte(_file, _l);

	for (var i = 0; i < _l; i++)
	{
		_chr = ord( string_char_at(_str, i + 1) );
	
		byteWrite_integer(_file, _chr, 2, true);
	}

	return (_l * 2) + 1;


}
