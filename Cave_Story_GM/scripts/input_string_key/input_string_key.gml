/// @desc Converts Input to string
/// @arg key
function input_string_key(argument0) {

	var _input = argument0, _ret = "(No Key)";

	switch(_input)
	{
		default:
			if string_letters(chr(_input)) != ""
			{
				_ret = string_upper(chr(_input));
			}
			else if string_digits(chr(_input)) != ""
			{
				_ret = chr(_input);
			}
			break;
		case(vk_alt): _ret = "Alt"; break;
		case(vk_shift): _ret = "Shift"; break;
		case(vk_backspace): _ret = "Backspace"; break;
		case(vk_enter): _ret = "Enter"; break;
		case(vk_tab): _ret = "Tab"; break;
		case(vk_control): _ret = "Control"; break;
	
		case(vk_left): _ret = "Left Arrow"; break;
		case(vk_right): _ret = "Right Arrow"; break;
		case(vk_up): _ret = "Up Arrow"; break;
		case(vk_down): _ret = "Down Arrow"; break;
	}

	return _ret;


}
