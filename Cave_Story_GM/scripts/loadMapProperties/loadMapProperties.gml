/// @desc Populate Properties
function loadMapProperties() {

	var _file = file_bin_open(file_dir_string(DATADIR, DATANAME) + "_classic.pxp", 0),
	_name = "", _prop, _val, _chr = "", _size = file_bin_size(_file);

#region enum Map_Property

	enum Map_Property
	{
		tileset,
		mapName,
		backgroundType,
		backgroundSprite,
		npcSprite1,
		npcSprite2, 
		bossID,
		caption,
		unknown,
	
		tilesetName,
		backgroundSpriteName,
	}

#endregion

	for (var i = 0; i <= 0xFF; i++)
	{
		if (0xC8 * i) + 0x20 >= _size
		{
			break;
		}
	
		file_bin_seek(_file, (0xC8 * i) + 0x20);
		_name = "";
	
		// Get Map Name
		repeat(0x20)
		{
			_chr = file_bin_read_byte(_file);
			if _chr >= 32
			{
				_name += chr(_chr);
			}
		}
	
	#region Get Properties
	
		// OBSELETED (Takes up too much memory)
	
		/*
	
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
		_val = ""; repeat(0x4) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_bkType = get_classic_backgroundMode(real(_val != ""? _val: 0));
	
		// Background Sprite
		_val = ""; repeat(0x20) 
		{_chr = file_bin_read_byte(_file); if _chr >= 32 {_val += chr(_chr)}}
		_bkSprite = get_classic_background(_val);
	
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
	
		*/
	
	#endregion
	
		ds_map_add(PROPERTIES, _name, (0xC8 * i));
	}

	file_bin_close(_file);


}
