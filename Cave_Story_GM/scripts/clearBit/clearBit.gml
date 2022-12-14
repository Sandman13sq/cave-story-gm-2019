/// @desc Returns value that removes all of the flags given
/// @arg value,flag1,flag2,...
function clearBit() {

	var _flag = argument[0];

	for (var i = 1; i < argument_count; i++)
	{
		_flag = _flag & ~(1 << argument[i]);
	}

	return _flag;


}
