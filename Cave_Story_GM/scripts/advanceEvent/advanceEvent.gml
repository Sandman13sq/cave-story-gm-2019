/// @desc Runs next event
function advanceEvent() {

	with EVENT
	{
		script_mode = Script_Mode.cmd;
		command_runner_classic();
	}


}
