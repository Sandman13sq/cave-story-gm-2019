/// @desc Returns value that omits flags not shared
/// @arg value,otherValue,flag1,flag2,...
function andBit() {

	var _flag = argument[0], _otherFlag = argument[1];

	for (var i = 2; i < argument_count; i++)
	{
		if !( ( _flag & (1 << argument[i]) ) && ( _otherFlag & (1 << argument[i]) ) )
		{
			_flag = _flag & ~(1 << argument[i]);	
		}
	}

	return _flag;


}
