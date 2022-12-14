/// Returns part of string
/// @arg str,starting_pos,leading_str,terminating_str,includeTerminating?
function get_string_part() {

	var _str = string_copy(argument[0], argument[1], string_length(argument[0])),
	_pos = string_pos(argument[2], _str);

	if argument[2] == ""
	{
		_pos = argument[1];
	}

	_str = string_copy(_str, _pos, string_length(_str));
	
	_pos = string_pos(argument[3], string_copy(_str, 2, string_length(_str)));

	if _pos = 0 {_pos = string_length(_str)}

	if argument[4]
	{
		return string_copy(_str, 1, _pos + string_length(argument[3]))
	}
	else
	{
		return string_copy(_str, 1, _pos)
	}


}
