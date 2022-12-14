/// @desc 
function applyGlobalScripts() {

	// Read Global events if not already done
	if ds_map_empty(GLOBAL_SCRIPT)
	{
		var _str = "", _path = file_dir_string(DATADIR, DATANAME);
	
		scriptToMap(get_TSC_string(_path + "Head.tsc"), GLOBAL_SCRIPT);
	}

	// Load all Global events to event dict
	var _eventIndex = ds_map_find_first(GLOBAL_SCRIPT);

	while (_eventIndex != undefined)
	{
		ds_map_add(event_dict, _eventIndex, GLOBAL_SCRIPT[? _eventIndex]);
	
		_eventIndex = ds_map_find_next(GLOBAL_SCRIPT, _eventIndex);
	}

	addEvent(0, "<END");


}
