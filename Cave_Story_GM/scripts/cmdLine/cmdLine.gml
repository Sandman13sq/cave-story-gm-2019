/// @desc Returns converted command line
/// @arg command,*arg1,*arg2,...
function cmdLine() {

	var _str = argument[0];

	for (var i = 1; i < argument_count; i++)
	{
		_str += value_to_string(argument[i], 4);
	
		if i < argument_count - 1
		{
			_str += ":";
		}
	}

	return _str;


}
