/// @desc Runs Script Event
/// @arg event,*ds_map
function runEvent() {

	var _event, 
	_eventIndex = argument[0], _dict = argument_count > 1? argument[1]: -1;

	// Use Room script if no map is given 
	if _dict <= -1
	{
		var _scrObj = mas_script;
	
		if instance_exists(_scrObj)
		{
			EVENT_MAP = _scrObj.event_dict;
		}
	}
	else
	{
		EVENT_MAP = _dict;
	}

	_event = EVENT_MAP[? _eventIndex];

	// Run if event exists
	instance_destroy(mas_event);

	if !is_undefined(_event)
	{
		with instance_create_depth(0, 0, 0, mas_event_classic)
		{
			event = _event;
			eventIndex = _eventIndex;
			eventMap = EVENT_MAP;
		
			script_str = get_string_part(event, 1, "<", "", true);
			is_running = true;
			
			if DEBUG
			{
				consoleOut("Running Event: " + string(_eventIndex));
			}
			
			//msgObj(CAMERA_X + CAMERA_W / 2, CAMERA_Y + CAMERA_H / 2, "Event", _event)
		}
	}
	else
	{
		consoleOut("Event \"" + string(_eventIndex) + "\" Does Not Exist", c_red);
	}


}
