/// @desc (Show message shortie)
/// @arg *string,*string,*string...
function msg() {

	if !keyboard_check_direct(vk_shift)
	{
		var _str = "";
		for (var i = 0; i < argument_count; i++)
		{
			_str += string(argument[i]) + " ";
		}
	
		// DISABLED FOR RELEASE
	
		show_message(_str);
	}



}
