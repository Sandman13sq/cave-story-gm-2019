/*
*/

/// @desc Saves player data to file
/// @arg path,*face

function saveProfile(_path, _face=-1)
{
	var b = buffer_create(1, buffer_grow, 1);

	// Profile Name
	BufferWriteString(b, GAME.username);

	// Mod Name
	BufferWriteString(b, DATANAME);

	// Date (Not the Doctor)
	BufferWriteString(b, string(current_month) + "/" + string(current_day) + "/" + string(current_year));

	// Time
	BufferWriteString(b, string(current_hour) + ":" + value_to_string(current_minute, 2));

	// Stage Caption
	BufferWriteString(b, mas_stage.caption);

	// Stage ID
	buffer_write(b, buffer_u32, mas_stage.index);

	// Face
	if (_face == -1)
	{
		_face = 1 + irandom(28);
	}
	buffer_write(b, buffer_u32, _face);

	// Weapons
	var _list = getPlayerData(Player_Stat.weapons),
	_weaponCount = ds_list_size(_list), 
	_wep, _meta, _data;

	buffer_write(b, buffer_u8, _weaponCount);

	for (var i = 0; i < _weaponCount; i++)
	{
		_wep = _list[| i];
		_meta = getWeaponMeta(0, _wep);
		_data = getWeaponData(0, _wep);
	
		// Index
		buffer_write(b, buffer_u8, _wep);
	
		// Level
		buffer_write(b, buffer_u32, _meta[? Wep_Meta.level]);
		buffer_write(b, buffer_u32, _meta[? Wep_Meta.levelMax]);
	
		// Experience
		buffer_write(b, buffer_u32, _data[? Wep_Data.energy]);
	
		// Ammo
		buffer_write(b, buffer_u32, _meta[? Wep_Meta.ammo]);
		buffer_write(b, buffer_u32, _meta[? Wep_Meta.ammoMax]);
	}

	// Items
	var _list = getPlayerData(Player_Stat.items), 
	_itemCount = ds_list_size(_list);

	buffer_write(b, buffer_u8, _itemCount);

	for (var i = 0; i < _itemCount; i++)
	{
		buffer_write(b, buffer_u8, _list[| i]);
	}
	
	// Health
	buffer_write(b, buffer_u32, getPlayerData(Player_Stat.life));

	// Max Health
	buffer_write(b, buffer_u32, getPlayerData(Player_Stat.lifeMax));

	var _playerInst = instance_find(PLAYER, 0);

	// X Position
	buffer_write(b, buffer_u32, getCenterX(_playerInst) div UNIT_PX);

	// Y Position
	buffer_write(b, buffer_u32, getCenterY(_playerInst) div UNIT_PX);

	// Music Index
	buffer_write(b, buffer_u16, MUSIC.gameBGM_index);

	// Game Flags
	var _l = array_length(FLAGS_EVENT);

	for (var i = 0; i < _l; i++)
	{
		buffer_write(b, buffer_u64, FLAGS_EVENT[i]);
	}
	
	// Equip Flags
	buffer_write(b, FLAGS_EQUIP, buffer_u64);

	// Stages
	var _map = TELEPORTER_STAGE,
	_l = ds_map_size(_map),
	_key = ds_map_find_first(_map);

	buffer_write(b, buffer_u8, _l);

	while (_key != undefined)
	{
		buffer_write(b, buffer_u16, _key);
		buffer_write(b, buffer_u16, _map[? _key]);
	
		_key = ds_map_find_next(_map, _key);
	}

	// Current Palette
	buffer_write(b, buffer_u8, GAME.playerPaletteIndex);
	
	buffer_save(b, _path);
	buffer_delete(b);


}


/// @desc Reads profile into array
/// @arg path

function readProfile(_path) 
{
	var _profile = array_create(32);
	var b = buffer_load(_path);
	
	_profile[Profile.path] = _path;
	
	_profile[Profile.name] = BufferReadString(b);
	_profile[Profile.modname] = BufferReadString(b);
	
	_profile[Profile.date] = BufferReadString(b);
	_profile[Profile.time] = BufferReadString(b);
	_profile[Profile.stageName] = BufferReadString(b);
	
	_profile[Profile.stage] = buffer_read(b, buffer_u32);
	
	_profile[Profile.face] = buffer_read(b, buffer_u32);
	
	// Weapons
	_profile[Profile.weaponCount] = buffer_read(b, buffer_u8);
	
	for (var i = 0; i < _profile[Profile.weaponCount]; i++)
	{
		var _data = array_create(3), _lvl;
		
		_profile[Profile.weapon, i] = buffer_read(b, buffer_u8);
		
		_data[0, Weapon_Data.level] = buffer_read(b, buffer_u32);
		_data[0, Weapon_Data.maxLevel] = buffer_read(b, buffer_u32);
		
		_lvl = _data[0, Weapon_Data.level];
		
		_data[_lvl, Weapon_Data.experience] = buffer_read(b, buffer_u32);
		
		_data[_lvl, Weapon_Data.ammo] = buffer_read(b, buffer_u32);
		_data[_lvl, Weapon_Data.maxAmmo] = buffer_read(b, buffer_u32);
		
		_profile[Profile.weaponData, i] = _data;
	}
	
	// Items
	_profile[Profile.itemCount] = buffer_read(b, buffer_u8);
	
	for (var i = 0; i < _profile[Profile.itemCount]; i++)
	{
		_profile[Profile.item, i] = buffer_read(b, buffer_u8);
	}
	
	// Health
	_profile[Profile.life] = buffer_read(b, buffer_u32);
	_profile[Profile.lifeMax] = buffer_read(b, buffer_u32);
	
	buffer_delete(b);

	return _profile;


}


/// @desc Loads player profile as array
/// @arg path,*loadMap?

function loadProfile(_path, _loadMap=true) 
{
	var b = buffer_load(_path);
	
	// Keep what you want to display at the beginning

	// Profile Name
	GAME.username = BufferReadString(b);

	// Mod Name
	GAME.dataname = BufferReadString(b);

	BufferReadString(b); // Date
	BufferReadString(b); // Time
	BufferReadString(b); // Map Caption

	// Stage ID
	var _mapIndex = buffer_read(b, buffer_u32);

	// Face
	buffer_read(b, buffer_u32);

	// Weapons
	var _list = getPlayerData(Player_Stat.weapons),
	_weaponCount = buffer_read(b, buffer_u8),
	_wep, 
	_lvl, _maxLvl, _exp,
	_ammo, _maxAmmo;

	ds_list_clear(_list);

	for (var i = 0; i < _weaponCount; i++)
	{
		_wep = buffer_read(b, buffer_u8);
	
		_lvl = buffer_read(b, buffer_u32);
		_maxLvl = buffer_read(b, buffer_u32);
	
		_exp = buffer_read(b, buffer_u32);
	
		_ammo = buffer_read(b, buffer_u32);
		_maxAmmo = buffer_read(b, buffer_u32);
	
		setWeaponLevel(_wep, _lvl, _exp);
		setWeaponAmmo(_wep, _ammo, _maxAmmo);
	
		addPlayerWeapon(_wep);
	}

	// Items
	var _list = getPlayerData(Player_Stat.items),
	_itemCount = buffer_read(b, buffer_u8);
	ds_list_clear(_list);

	for (var i = 0; i < _itemCount; i++)
	{
		addPlayerItem(buffer_read(b, buffer_u8));
	}

	// Health
	setPlayerData(Player_Stat.life, buffer_read(b, buffer_u32));
	setPlayerData(Player_Stat.lifeMax, buffer_read(b, buffer_u32));

	var _playerX = buffer_read(b, buffer_u32),
	_playerY = buffer_read(b, buffer_u32),
	_music = buffer_read(b, buffer_u16);
	
	// Game Flags
	var _l = array_length(FLAGS_EVENT);
	
	for (var i = 0; i < _l; i++)
	{
		FLAGS_EVENT[i] = buffer_read(b, buffer_u64);
	}
	
	// Equip Flags
	FLAGS_EQUIP = buffer_read(b, buffer_u64);

	// Stages
	var _map = TELEPORTER_STAGE, _key, _l;

	_l = buffer_read(b, buffer_u8);

	repeat(_l)
	{
		_key = buffer_read(b, buffer_u16);
		_map[? _key] = buffer_read(b, buffer_u16);
	}

	// Current Palette
	GAME.playerPaletteIndex = buffer_read(b, buffer_u8);
	
	buffer_delete(b);

	if instance_exists(obj_fade) {instance_destroy(obj_fade)};

	if _loadMap
	{
		bgm(Music.null);
		load_classic_map(_mapIndex, 0, _playerX, _playerY);
		bgm(_music);
	}


}
