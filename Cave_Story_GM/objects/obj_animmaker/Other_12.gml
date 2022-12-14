/// @desc Load Animation Data

if jsonPath != ""
{
	var _file = file_bin_open(jsonPath, 0);
	
	groupCount = byteRead_integer(_file, 8, false);
	
	var _seq, _frame, _prop,
	_sequenceCount, _frameCount;
	
	ds_list_clear(name);
	ds_list_destroy_chain(seqName, 1);
	seqName = list_create();
	ds_list_destroy_chain(group, 2);
	group = list_create();
	
	// For Each Group
	for (var i = 0; i < groupCount; i++)
	{
		name[| i] = byteRead_string(_file);
		
		// Sequence List
		ds_list_add(group, list_create());
		
		ds_list_add(seqName, list_create());
		
		_seq = group[| i];
		_sequenceCount = byteRead_integer(_file, 4, false);
		
		// For Each Sequence
		for (var j = 0; j < _sequenceCount; j++)
		{
			ds_list_add(seqName[| i], byteRead_string(_file));
			
			// Frame List
			ds_list_add(_seq, list_create());
			
			_frame = _seq[| j];
			_frameCount = byteRead_integer(_file, 4, false);
			
			// For Each Frame
			for (var l = 0; l < _frameCount; l++)
			{
				ds_list_add(_frame, list_create());
				_prop = _frame[| l];
				
				ds_list_add(_prop, byteRead_asset(_file) );
				ds_list_add(_prop, byteRead_integer(_file, 4, false));
				ds_list_add(_prop, byteRead_integer(_file, 4, false));
				ds_list_add(_prop, byteRead_integer(_file, 4, false) - 127);
				ds_list_add(_prop, byteRead_integer(_file, 4, false) - 127);
				ds_list_add(_prop, byteRead_integer(_file, 8, false));
			}
		}
	}
	
	file_bin_close(_file);
	
	event_user(0);
}