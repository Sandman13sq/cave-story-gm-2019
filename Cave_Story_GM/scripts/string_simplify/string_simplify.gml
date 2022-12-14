/// @desc Redoes string. Used for string literals
/// @arg string
function string_simplify() {
	var _str = "", _chr = "", _l = string_length(argument[0]); 

	for (var i = 1; i <= _l; i++)
	{
		_chr = string_char_at(argument[0], i);
	
		switch(_chr)
		{
			default: _str += _chr; break;
			case("\n"): case("\r"): _str += "\n"; break;
		}	
	}

	_str = string_replace_all(_str, "\n\n", "\n")

	// Trimms whitespace
	while (string_char_at(_str, 1) == "\n"
	|| string_char_at(_str, 1) == " ")
	{
		_str = string_copy(_str, 2, string_length(_str) - 1);
	}

	return _str;


}
