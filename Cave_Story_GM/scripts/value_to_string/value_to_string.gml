/// Inserts characters where spaces would be
/// @arg value,digits
function value_to_string(argument0, argument1) {
	var _str = string(argument0);

	while string_length(_str) < argument1
	{
		_str = "0" + _str;
	}

	return _str;


}
