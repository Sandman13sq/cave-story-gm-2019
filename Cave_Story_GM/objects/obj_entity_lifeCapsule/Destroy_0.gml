/// @desc 

// Inherit the parent event
event_inherited();

// Set Life Flag if Destroyed from Event
var _event = event, _flag = ID;

if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.eventRunning)
{
	if EVENT.eventIndex == _event
	{
		setEventFlag(_flag);
	}
}