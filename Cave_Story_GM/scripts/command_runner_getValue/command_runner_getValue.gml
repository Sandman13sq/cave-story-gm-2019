/// @desc Runs script commands
/// @arg lastValue?
function command_runner_getValue() {

	var _value = string_copy(script_str, script_pos, 4);

	script_pos += 5 - bool(argument[0]);

	return real(_value);


}
