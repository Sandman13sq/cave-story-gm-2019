/// @desc Clears event-related things
function command_clear() {

	FREEZE = getBit(FLAGS_GAMEPLAY, Gameplay_Flag.stayFrozen);

	//clearGameplayFlag(Gameplay_Flag.noInput);
	setGameplayFlag(Gameplay_Flag.showGUI);
		
	global.inputBuffer_button = 0;
	global.inputBuffer_alarm = 0;

	if instance_exists(RADAR)
	{
		with RADAR
		{
			radar_draw = true;
		}
	}

	//with ENTITY {entityCheckEventFlag()};
	//updateHiddenEntity();

	global.InputObj.inputBuffer_alarm = 0;
	is_running = false;

	with obj_fade
	{
		if fadeIn {instance_destroy()}
	}

	instance_destroy(obj_eventObj);


}
