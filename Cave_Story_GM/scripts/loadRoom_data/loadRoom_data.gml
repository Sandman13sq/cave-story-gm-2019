///
function loadRoom_data() {

	var _path;

	/// Load Tile File
	_path = file_get_anyCase(stage_dir, stage_name + stage_ext[stg.tile]);
	stage_file[stg.tile] = file_bin_open(_path, 0);
	// Load Entity File
	_path = file_get_anyCase(stage_dir, stage_name + stage_ext[stg.entities]);
	stage_file[stg.entities] = file_bin_open(_path, 0);
	// Load Script File
	_path = file_get_anyCase(stage_dir, stage_name + stage_ext[stg.script]);
	var _str = get_TSC_string(_path);

	cout("Loading Stage \"" + string(stage_name) + "\"");

	with instance_create_depth(0, 0, 0, mas_script)
	{
		scriptToMap(_str, event_dict);
	}

	if stage_file[stg.tile]
	{
		instance_create_depth(32, 96, 0, PLAYER);
		instance_create_depth(0, 0, 0, mas_background);
		
		var _prop = getMapProperties(stage_name), 
		_tileSet, _bk, _bkMode;
		
		// Tileset
		_tileSet = _prop[Map_Property.tileset];
	
		// Background Image
		_bk = _prop[Map_Property.backgroundSprite];
	
		// Background Type
		_bkMode = _prop[Map_Property.backgroundType];
	
		// Load Collision File
		stage_file[stg.collision] = 
			file_bin_open(stage_dir + _prop[Map_Property.tilesetName] + stage_ext[stg.collision], 0);
	
		mas_background.bkSprite = _bk;
		mas_background.bkMode = _bkMode;
	
		var _collLayer = layer_get_id("collision");
	
		GAME.collision_layer = _collLayer;
	
		setStageCollisionLayer(_collLayer);
	
		// Get Width and Height from Tile File
		var _pos = 0x4, _list = file_bin_toList(stage_file[stg.tile]),
		_width = _list[| _pos++] + _list[| _pos++] * 0x100,
		_height = _list[| _pos++] + _list[| _pos++] * 0x100,
		_collList = -1, _tileType;
	
		room_width = _width * UNIT_PX;
		room_height = _height * UNIT_PX;
	
		// Create Front and Back Tilemaps
		var _tile;
	
		ds_grid_resize(COLLMAP, _width, _height);
	
	#region Load Collision From File if Exists
	
		if stage_file[stg.collision]
		{
			_collList = file_bin_toList(stage_file[stg.collision]);
			var _l = ds_list_size(_collList);
			for (var i = _l - 1; i >= 0; i--)
			{
				_tileType[i] = _collList[| i];
			}
			file_bin_close(stage_file[stg.collision]);
		}
		else {_tileType = array_create(256, 0x41);}
	
	#endregion
	
		setStageName(stage_name, _prop[Map_Property.caption]);
		stageLayer_create(0, _tileSet, _width, _height, _tileType);
	
	#region Draw Tiles
	
		for (var i = 0; i < _height; i++)
		{
			for (var j = 0; j < _width; j++)
			{
				_tile = _list[| _pos];
			
				changeStageTile(0, j, i, _tile);
			
				_pos++;
			}
		}
	
		/*
		with instance_create_depth(0, 0, 0, obj_tileRim)
		{
			tileset = _tileSet;
			tile = tile_set_index(0, _tile);
			width = _width;
			height = _height;
		}
		*/
	
	#endregion
	
		file_bin_close(stage_file[stg.tile]);
	
		list_free(_collList);
		list_free(_list);
	
	#region Create Entities
	
		if stage_file[stg.entities]
		{
			var _entityList = file_bin_toList(stage_file[stg.entities]),
			_entityCount = _entityList[| 4] + _entityList[| 5] * 0x100,
			_pos = 8, _x, _y, _ID, _event, _type, _flags;
			for (var i = 0; i < _entityCount; i++)
			{
				_x = _entityList[| _pos++] + _entityList[| _pos++] * 0x100;
				_y = _entityList[| _pos++] + _entityList[| _pos++] * 0x100;
				_ID = _entityList[| _pos++] + _entityList[| _pos++] * 0x100;
				_event = _entityList[| _pos++] + _entityList[| _pos++] * 0x100;
				_type = _entityList[| _pos++] + _entityList[| _pos++] * 0x100;
				_flags = _entityList[| _pos++] + _entityList[| _pos++] * 0x100;
			
				create_classic_entity(_x * UNIT_PX, _y * UNIT_PX, 
					LyrDepth.backEntities, _type, _event, _ID, Dir.left, _flags);
			}
		
			file_bin_close(stage_file[stg.entities]);
		
			list_free(_entityList);
		}
	
		with ENTITY {entityCheckEventFlag()};
		updateHiddenEntity();
	
	#endregion
		
		PLAYER.x = playerSetX * UNIT_PX;
		PLAYER.y = playerSetY * UNIT_PX;
	
		cout(PLAYER.x, PLAYER.y)
	
		PLAYER.depth = LyrDepth.player;
	
	#region Set Camera Bounds
	
		calculateCameraBounds(COLLMAP);
		
		setCamera_state(Camera_State.player);
		setCamera_center(PLAYER_X, PLAYER_Y);
	
	#endregion
	
		runEvent(event);
	
		setBit((Mas.stage).flag, Stage_Flag.classic);
	}
	// No associated tile file
	else
	{
		//msg("Stage \"", stage_name, "\" not Found.\n Restarting Game.")
		game_restart();
	}
	//*
	//*/

	with ENTITY
	{
		if entityDirection == Dir.right {image_xflip = 1;}
		else if entityDirection == Dir.left {image_xflip = -1;}
	
		if getBit(flag, Entity_Flag.animates)
		{
			updateAnimation();
		}
	}

	with PLAYER
	{
		direction = dirAngle(entityDirection);
	}


}
