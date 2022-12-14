/// @desc Keeps flag if matches value bit
/// @arg flag,bit
function otherFlag(argument0, argument1) {

	var _flag = 1 << argument1;

	if (flag & _flag) || (argument0 & _flag)
	{
		flag = flag | _flag;
	}
	else
	{
		flag = flag & ~(_flag)
	}

	return flag;


}
