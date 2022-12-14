/// @desc Returns true if arguments match value
/// @arg value,arg,arg,...
function is() {

	var _ret = false, _value = argument[0];

	for (var i = 1; i < argument_count; i++)
	{
		if argument[i] == _value
		{
			_ret = true;
			break;
		}
	}

	return _ret;


}
