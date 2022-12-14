/// @desc Get Map Sprite and Name
	
if mapName == ""
{
	done = true;
	
	list_free(mapDataList);
	mapDataList = -1;
	
	file_find_close();
}
// Load Map Tileset
else
{
	#region Map Tileset
	
	var _dir = directory, _file, _index = mapCount, _list, _prop,
	_previewPath = file_dir_string(DATADIR, DATANAME, "Previews"), _previewFilename;
	
	mapName = string_cut(mapName, 0, 4);
	
	if ( file_exists(_dir + mapName + ".pxe") || file_exists(_dir + string_lower(mapName) + ".pxe") )
	&& ( file_exists(_dir + mapName + ".tsc") || file_exists(_dir + string_lower(mapName) + ".tsc") )
	{
		if file_exists(_dir + mapName + ".pxm") 
			{_file = file_bin_open(_dir + mapName + ".pxm", 0);}
		else
			{_file = file_bin_open(_dir + string_lower(mapName) + ".pxm", 0);}
		
		_prop = getMapProperties(mapName);
		
		stageArr[_index, 7] = -1; // Sprite
		
		stageArr[_index, 6] = _prop[Map_Property.caption];
		stageArr[_index, 0] = mapName;
		
		// Get Tileset and Background Index
		stageArr[_index, 1] = _prop[Map_Property.tileset]; // Tileset
		stageArr[_index, 2] = _prop[Map_Property.backgroundSprite]; // Background
		
		// Read Tile Position Data
		var _l = file_bin_size(_file), 
		_data = array_create(0x8), 
		_tile = array_create(_l - 0x8),
		_pos = 0;
		
		file_bin_seek(_file, 0);
		
		// Get Data
		for (var i = 0; i < _l; i++)
		{
			if i >= 0x8
			{
				_tile[_pos] = file_bin_read_byte(_file);
				_pos++;
			}
			else
			{
				_data[i] = file_bin_read_byte(_file);
			}
		}
		
		_pos = 0x4;
		stageArr[_index, 3] = _data[_pos++] + _data[_pos++] * 0x100; // Width
		stageArr[_index, 4] = _data[_pos++] + _data[_pos++] * 0x100; // Height
		stageArr[_index, 5] = _tile; // Tile Data
		
		file_bin_close(_file);
		
		if file_exists(_previewPath + string(mapName) + ".png")
		{
			_previewFilename = _previewPath + string(mapName) + ".png";
		}
		else
		{
			_previewFilename = _previewPath + string(mapName) + ".gif";
		}
		cout(_index, _previewFilename);
		
		if file_exists(_previewFilename)
		{
			stage_sprite[_index] = sprite_add(_previewFilename, 1, false, false, 0, 0);
		}
		
		_index++;
	}
	
	#endregion
		
	mapName = file_find_next();
	
	mapCount = _index;
}