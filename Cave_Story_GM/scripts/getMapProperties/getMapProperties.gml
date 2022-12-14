/// @desc Populates array with bytes for map properties of classic maps
/// @arg mapname
function getMapProperties(argument0) {

	if ds_map_empty(PROPERTIES)
	{
		loadMapProperties();
	}

	var _key = argument0;

	if is_string(_key)
	{
		if !ds_map_exists(PROPERTIES, _key) {_key = string_lower(_key);}
		if !ds_map_exists(PROPERTIES, _key) {_key = string_capitalize(_key);}
		if !ds_map_exists(PROPERTIES, _key) {_key = string_upper(_key);}
	
		if !ds_map_exists(PROPERTIES, _key) 
		{
			_key = ds_map_find_first(PROPERTIES);
		
			var _name = string_lower(argument0);
		
			// See if any key's spelling matches name
			while ( ds_map_exists(PROPERTIES, _key) )
			{
				if is_string(_key)
				{
					if _name == string_lower(_key)
					{
						break;
					}
				}
			
				_key = ds_map_find_next(PROPERTIES, _key);
			}
		}
	}

	return PROPERTIES[? _key];

	/*

	var _file = file_bin_open(file_dir_string(DATADIR, DATANAME) + "_classic.pxp", 0),
	_prop, _val, _chr = "",
	_tileset,
	_mapname,
	_bkType,
	_bkSprite,
	_npcSprite1,
	_npcSprite2,
	_bossID,
	_caption;

	file_bin_seek(_file, PROPERTIES[? argument0]);

#region Get Properties
	
		// Tileset
		_val = ""; repeat(0x20) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_tileset = get_classic_tileset(_val);
		_prop[Map_Property.tilesetName] = _val;
	
		// Mapname
		_val = ""; repeat(0x20) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_mapname = _val;
	
		// Background Type
		_val = 0; for (var j = 0; j < 0x4; j++)
		{_val += file_bin_read_byte(_file)}
		_bkType = get_classic_backgroundMode(_val);
	
		// Background Sprite
		_val = ""; repeat(0x20) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_bkSprite = get_classic_background(_val);
		_prop[Map_Property.backgroundSpriteName] = _val;
	
		// NPC Sprite 1
		_val = ""; repeat(0x20) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_npcSprite1 = _val;
	
		// NPC Sprite 2
		_val = ""; repeat(0x20) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_npcSprite2 = _val;
	
		// Boss ID
		_val = ""; repeat(1) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_bossID = real(real(_val != ""? _val: 0));
	
		// Map Caption
		_val = ""; repeat(0x20) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_caption = _val;
	
		_prop[Map_Property.tileset] = _tileset;
		_prop[Map_Property.mapName] = _mapname;
		_prop[Map_Property.backgroundType] = _bkType;
		_prop[Map_Property.backgroundSprite] = _bkSprite;
		_prop[Map_Property.npcSprite1] = _npcSprite1;
		_prop[Map_Property.npcSprite2] = _npcSprite2;
		_prop[Map_Property.bossID] = _bossID;
		_prop[Map_Property.caption] = _caption;
	
	#endregion

	file_bin_close(_file);

	return _prop;

/* end getMapProperties */
}
