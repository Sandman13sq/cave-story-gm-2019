/// @desc Outputs information to Game Maker 
/// @arg *str,*str,*str,*...
function cout() {

	var _str = "[" + object_get_name(object_index) + "]: ";

	for (var i = 0; i < argument_count; i++)
	{
		_str += string(argument[i]) + " ";
	}

	// DISABLED FOR RELEASE

	show_debug_message(_str);



}
