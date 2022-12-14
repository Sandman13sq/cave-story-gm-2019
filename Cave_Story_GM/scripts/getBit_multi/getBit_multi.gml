/// @desc Returns true if bit in value is set
/// @arg value,bit_index1,index2,...
function getBit_multi() {

	var _flag = argument[0], _ret = false;

	for (var i = 1; i < argument_count; i++)
	{
		if _flag & (1 << argument[i])
		{
			_ret = true; break;
		}
	}

	return _ret;


}
