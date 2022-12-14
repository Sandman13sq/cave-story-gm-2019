/// @desc Clears bit in flag variable
/// @arg bit,*bit,*bit...
function clearFlag() {

	for (var i = 0; i < argument_count; i++)
	{
		flag = flag & ~(1 << argument[i]);
	}

	return flag;


}
