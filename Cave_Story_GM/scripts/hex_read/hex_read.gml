/// @description ()
/// @param [xx]_str
/// @param index
function hex_read() {
	var _str = string(argument[0]), _index = (argument[1])*2;

	return b10(
	string_char_at(_str, _index+1)+
	string_char_at(_str, _index+2)
	);


}
