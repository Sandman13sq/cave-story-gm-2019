/// @desc Loads in mod data from directoryand returns array
/// @arg path
function loadModData(argument0) {

	var _dir = argument0,
	_filename,
	_data = array_create(8),
	_flag = 0,
	_stage = list_create(),
	_music = list_create();

	_data[Mod.dir] = _dir;

	#region Settings

	_filename = "modsettings.ini";

	if file_exists( _dir + _filename )
	{
		_flag = setBit(_flag, Mod_Flag.modSettingsExist);
	}

	ini_open( _dir + _filename );
	
	_data[Mod.name] = ini_read_string("info", "name", "New Story");
	_data[Mod.author] = ini_read_string("info", "author", choose("Mr Traveller", "Ms Traveller"));
	_data[Mod.version] = ini_read_string("info", "version", "Unknown Version");

	var _path = file_find_first(_dir + "Face\*", 0);
	
	if _path != ""
	{
		with instance_create_depth(0, 0, 0, obj_loadFaces)
		{
			path = _dir + _path;
		}
	}
	
	ini_close();

	#endregion

	#region Stage

	if directory_exists(_dir + "Stage")
	{
		_flag = setBit(_flag, Mod_Flag.stagesExist);
	
		var _stageDir = file_dir_string(_dir + "Stage"),
		_stageName = file_find_first(_stageDir + "\*", fa_directory);
	
		while (_stageName != "")
		{
			_stageName = filename_change_ext(_stageName, "");
		
			if file_exists(_stageDir + _stageName + ".pxe") != "" // Entities
			&& file_exists(_stageDir + _stageName + ".pxm") != "" // Stage Tiles
			{
				if ds_list_find_index(_stage, _stageName ) = -1
				{
					ds_list_add( _stage, _stageName );
				}
			}
		
			_stageName = file_find_next();
		}
	
		file_find_close();
	}

	#endregion

	#region Map Properties

	_filename = "mapproperties.json";

	if file_exists( _dir + _filename )
	{
		_flag = setBit(_flag, Mod_Flag.propertiesExist);
		
		var b = buffer_load(_dir + _filename);
		var stagejson = json_parse(buffer_read(b, buffer_text));
		buffer_delete(b);
		
		var _names = variable_struct_get_names(stagejson);
		var n = array_length(_names);
		var _prop, _stagedata;
		
		for (var i = 0; i < n; i++)
		{
			_stageName = _names[i];
			_stagedata = stagejson[$ _names[i]];
	
			_prop = array_create(16);
		
			_prop[Map_Property.tilesetName] = _stagedata[$ "tileset"];
			_prop[Map_Property.mapName] = _stagedata[$ "mapname"];
			_prop[Map_Property.backgroundType] = real( _stagedata[$ "bkType"] );
			_prop[Map_Property.backgroundSpriteName] = _stagedata[$ "bkSprite"];
			_prop[Map_Property.npcSprite1] = _stagedata[$ "npc1"];
			_prop[Map_Property.npcSprite2] = _stagedata[$ "npc2"];
			_prop[Map_Property.bossID] = real( _stagedata[$ "bossID"] );
			_prop[Map_Property.caption] = _stagedata[$ "caption"];
		
			_prop[Map_Property.tileset] = 
				get_classic_tileset( _prop[Map_Property.tilesetName] );
			_prop[Map_Property.backgroundSprite] = 
				get_classic_background( _prop[Map_Property.backgroundSpriteName] );
			
			PROPERTIES[? string_upper(_names[i])] = _prop;
		}
	}
	
	#endregion

	#region Music

	// Ogg Files

	if directory_exists( _dir + "Music" )
	{
		_flag = setBit(_flag, Mod_Flag.musicExist);
	
		var _musicDir = _dir + "Music";
	
		modData[Mod.musicDir] = _musicDir;
	
		var _musicFile = file_find_first(_musicDir + "\\\*.ogg", 0);
	
		while (_musicFile != "")
		{
			ds_list_add(_music, _musicFile);
		
			_musicFile = file_find_next();
		}
	
		file_find_close();
	}

	// Music Indecies and Sample Positions

	_filename = "musicsettings.ini";

	if file_exists( _dir + _filename )
	{
		_flag = setBit(_flag, Mod_Flag.musicSamplesExist);
	}

	ini_open( _dir + _filename );

	var _l = ds_list_size(_music), 
	_arr, _musicIndex;

	for (var i = 0; i < _l; i++)
	{
		_musicIndex = ini_read_real("index", _music[| i], 0);
	
		_arr = array_create(5);
	
		_arr[0] = ini_read_real("start", _music[| i], 1);
		_arr[1] = ini_read_real("end", _music[| i], 0);
		_arr[2] = _musicIndex;
		_arr[3] = _music[| i];
		_arr[4] = ini_read_string("title", _music[| i], "");
	
		ds_map_add(sampleData, _musicIndex, _arr);
	
		consoleOut(_arr[4] + " set for music index " + string(_musicIndex));
	}

	ini_close();

	#endregion

	// Delete immature stage data in properties map

	var _key = ds_map_find_first(PROPERTIES)

	while (ds_map_exists(PROPERTIES, _key))
	{
		if !is_array(PROPERTIES[? _key])
		{
			ds_map_delete(PROPERTIES, _key);
		}
	
		_key = ds_map_find_next(PROPERTIES, _key);
	}

	list_free(_stage);
	list_free(_music);

	_data[Mod.flag] = _flag;

	return _data;


}
