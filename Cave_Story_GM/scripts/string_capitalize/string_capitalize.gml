/// @desc Capitalizes first character of string if it is a letter
/// @arg string
function string_capitalize(argument0) {

	var _str = argument0;

	if string_letters(string_copy(_str, 1, 1)) != ""
	{
		_str = string_upper( string_copy(_str, 1, 1) ) + string_copy(_str, 2, string_length(_str) );
	}

	return _str;


}
