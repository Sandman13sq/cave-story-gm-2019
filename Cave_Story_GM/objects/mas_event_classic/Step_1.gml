/// @desc Modes

switch(script_mode)
{
	default:
		command_runner_classic(); 
		break;
		
	case(Script_Mode.profile):
		
		break;
		
	case(Script_Mode.pause):
		
		break;
		
	case(Script_Mode.waitTillStanding):
		if instance_exists(PLAYER)
		{
			if !getBit(PLAYER.flag, Entity_Flag.inAir)
			{
				script_mode = Script_Mode.cmd;
				command_runner_classic();
			}
		}
		break;
			
	case(Script_Mode.nod):
		if INPUT_ACTION_PRESSED || INPUT_BACK_PRESSED
		{
			script_mode = Script_Mode.cmd;
			command_runner_classic();
		}
		break;
		
	case(Script_Mode.yesNo):
		// Handled in obj_yesNo
		break;
			
	case(Script_Mode.text):
		if TEXT.ready
		{
			script_mode = Script_Mode.cmd;
			command_runner_classic();
		}
		break;
		
	case(Script_Mode.wait):
		// Controlled by alarm[0]
		if INPUT_ALT_HELD && INPUT_JUMP_PRESSED
		{
			var _time = alarm[0];
			alarm[0] = -1;
			script_mode = Script_Mode.cmd;
			simulate_step(_time);
		}
		break;
		
	case(Script_Mode.fade):
		if obj_fade.ready
		{
			obj_fade.ready = false;
			is_running = true;
			script_mode = Script_Mode.cmd;
			command_runner_classic();
		}
		break;
}