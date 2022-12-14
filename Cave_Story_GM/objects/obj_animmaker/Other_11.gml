/// @desc Save Animation Data

if jsonPath != ""
{
	var _file = file_bin_open(jsonPath, 2);
	
	file_bin_rewrite(_file);
	
	byteWrite_integer(_file, groupCount, 8, false);
	
	var _seq, _frame, _prop,
	_sequenceCount, _frameCount, _seqName;
	
	for (var i = 0; i < groupCount; i++)
	{
		byteWrite_string(_file, name[| i]);
		
		_seq = group[| i];
		_sequenceCount = ds_list_size(_seq);
		
		byteWrite_integer(_file, _sequenceCount, 4, false);
		
		for (var j = 0; j < _sequenceCount; j++)
		{
			_frame = _seq[| j];
			_frameCount = ds_list_size(_frame);
			
			_seqName = ds_list_find_value(seqName[| i], j);
			
			byteWrite_string(_file, _seqName);
			
			byteWrite_integer(_file, _frameCount, 4, false);
			
			for (var l = 0; l < _frameCount; l++)
			{
				_prop = _frame[| l];
				
				byteWrite_asset(_file, _prop[| 0], asset_sprite); // Sprite
				byteWrite_integer(_file, _prop[| 1], 4, false); // Subimage
				byteWrite_integer(_file, _prop[| 2], 4, false); // Duration
				byteWrite_integer(_file, _prop[| 3] + 127, 4, false); // X Offset
				byteWrite_integer(_file, _prop[| 4] + 127, 4, false); // Y Offset
				byteWrite_integer(_file, _prop[| 5], 8, false); // Flags
			}
		}
	}
	
	file_bin_close(_file);
}