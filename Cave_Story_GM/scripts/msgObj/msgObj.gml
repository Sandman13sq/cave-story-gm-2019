/// @desc (Show message shortie)
/// @arg x,y,*string,*string,*string...
function msgObj() {

	if !keyboard_check_direct(vk_shift)
	{
		var _str = "";
		for (var i = 2; i < argument_count; i++)
		{
			_str += string(argument[i]) + " ";
		}
	
		with instance_create_depth(argument[0], argument[1], -10000, obj_msg)
		{
			msgString = _str;
		}
	}


}
