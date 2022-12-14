/// @desc Returns true if event exists
/// @arg event,*ds_map
function eventExists() {

	var _event = argument[0], _dict, _ret = undefined;

	if argument_count > 1
	{
		_ret = ds_map_exists(argument[1], _event);
	}
	else
	{
		var _scrObj = mas_script;
	
		if instance_exists(_scrObj)
		{
			var _dict = _scrObj.event_dict;
		
			_ret = ds_map_exists(_dict, _event);
		}
	}

	return _ret;


}
