/// @desc Converts text to script in event object
/// @arg script_str
function create_room_script(argument0) {

	if !instance_exists(mas_script)
	{
		instance_create_depth(0, 0, 0, mas_script);
	}

	with mas_script
	{
		scriptToMap(argument0, event_dict);
	}



}
