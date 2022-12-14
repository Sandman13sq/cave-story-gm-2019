/// @desc Ends currently running event
function end_event() {

	if instance_exists(EVENT)
	{
		with EVENT
		{
			command_clear();
			clearGameplayFlag(Gameplay_Flag.noInput);
			instance_destroy();
		}
	}


}
