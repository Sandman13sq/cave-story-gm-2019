/// @desc Add Event
/// @arg index,event_string,*str2,*...
function addEvent() {

	if !instance_exists(mas_script)
	{
		instance_create_depth(0, 0, 0, mas_script);
	}

	with mas_script
	{
		var _script = argument[1];
	
		for (var i = 2; i < argument_count; i++)
		{
			_script += argument[i];
		}
	
		_script += "<END";
	
		event_dict[? argument[0]] = _script;
		lastIndex = argument[0];
	}


}
