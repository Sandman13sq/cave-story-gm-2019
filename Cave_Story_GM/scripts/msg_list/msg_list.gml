/// @desc (Show message shortie)
/// @arg list
function msg_list(argument0) {

	if !keyboard_check_direct(vk_shift)
	{
		var _str = "", _list = argument0,
		_l = ds_list_size(_list);
	
		for (var i = 0; i < _l; i++)
		{
			_str += string(_list[| i]) + "\n";
		}
	
		show_message(_str);
	}


}
