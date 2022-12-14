/// @desc Runs Event off of string
/// @arg script_string
function runEventLine(argument0) {

	var _script = string_simplify(string(argument0) + "<END");

	if instance_exists(mas_event) {instance_destroy(mas_event)};

	with instance_create_depth(0, 0, 0, mas_event_classic)
	{
		event = _script;
		eventIndex = -2;
		script_str = get_string_part(event, 1, "<", "", true);
		is_running = true;
	
		command_runner_classic();
	}


}
