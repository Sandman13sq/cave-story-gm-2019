/// @desc 

// Prevent Duplicates
if instance_number(mas_game) > 1
{
	instance_destroy();
	exit;
}

global.gameFrame = 0;
#macro CURRENT_FRAME global.gameFrame

#region Globals & Macros

global.savePath = "Profile_New.sav";
#macro PROFILE_PATH global.savePath

global.collisionMap = ds_grid_create(1, 1);
#macro COLLMAP global.collisionMap

global.properties = ds_map_create();
#macro PROPERTIES global.properties

global.freeze = false;
#macro FREEZE global.freeze

global.inStepSimulation = false;
#macro STEPSIM global.inStepSimulation

global.debug = false;
#macro DEBUG global.debug

global.gameFlag_Event = array_create(160, 0);
#macro FLAGS_EVENT global.gameFlag_Event

global.Event_Dict = -1;
#macro EVENT_MAP global.Event_Dict

global.gameFlag_Skip = 0;
#macro FLAGS_SKIP global.gameFlag_Skip

global.gameFlag_gameplay = 0;
#macro FLAGS_GAMEPLAY global.gameFlag_gameplay

global.teleporterStage = ds_map_create();
#macro TELEPORTER_STAGE global.teleporterStage

global.gameFlag_equip = 0;
#macro FLAGS_EQUIP global.gameFlag_equip

#region Equip Flags

enum Equip_Flag
{
	booster0_8 = 0,
	radar = 1,
	airTank = 4,
	booster2_0 = 5,
	mimigaMask = 6,
	whimsicalStar = 7,
	
	curly = 13,
}

#endregion

#region Gameplay Flags

enum Gameplay_Flag
{
	eventRunning,
	playerExists,
	noInput,
	showGUI,
	cameraChange,
	stayFrozen,
}

#macro INPUT_LOCKED (FLAGS_GAMEPLAY & 1 << Gameplay_Flag.noInput)

#endregion

global.gameFlag_GM = 0;
#macro FLAGS_GM global.gameFlag_GM

#region GM Flags

enum GM_Flag
{
	classicFaces,
	classicFade,
	dreamStoryFont,
	startWith_edge,
	startWith_shark,
	startWith_grenadeLauncher,
	startWith_booster0_1,
	startWith_airtank,
	energyGravitation,
	
	debug,
}

#endregion

global.globalScript = ds_map_create();
#macro GLOBAL_SCRIPT global.globalScript

#endregion

collision_layer = -1;
collision_tilemap = -1;

#region Mod Data

dataname = "Classic";
datadir = "Mods";
datafaces = spr_faceAll;
datafaceIndex = 0;

#macro DATANAME mas_game.dataname
#macro DATADIR mas_game.datadir
#macro DATAFACE mas_game.datafaceIndex

#region enum Mod

enum Mod
{
	dir,
	
	name,
	author,
	version,
	
	flag,
	settings,
	
	mapProperties,
	musicDir,
	musicSample,
}

#endregion

#region enum Mod_Flag

enum Mod_Flag
{
	propertiesExist,
	facesExist,
	musicExist,
	musicSamplesExist,
	modSettingsExist,
	stagesExist,
}

#endregion

sampleData = ds_map_create();

loadMapProperties();

#region Export Properties

/*

var _str = "", _key = ds_map_find_first(PROPERTIES),
_prop, _list = list_create();

while ( !is_undefined(_key) )
{
	ds_list_add(_list, _key);
	
	_key = ds_map_find_next(PROPERTIES, _key);
}

ds_list_sort(_list, true);

var _l = ds_list_size(_list);

for (var i = 0; i < _l; i++)
{
	_prop = getMapProperties( _list[| i] );
	
	_str += "[" + string( _list[| i] ) + "]\n";
	
	_str += "tileset = \"" + string( _prop[Map_Property.tilesetName] ) + "\"\n";
	_str += "mapname = \"" + string( _prop[Map_Property.mapName] ) + "\"\n";
	_str += "bkType = \"" + string( _prop[Map_Property.backgroundType] ) + "\"\n";
	_str += "bkSprite = \"" + string( _prop[Map_Property.backgroundSpriteName] ) + "\"\n";
	_str += "npc1 = \"" + string( _prop[Map_Property.npcSprite1] ) + "\"\n";
	_str += "npc2 = \"" + string( _prop[Map_Property.npcSprite2] ) + "\"\n";
	_str += "bossID = \"" + string( _prop[Map_Property.bossID] ) + "\"\n";
	_str += "caption = \"" + string( _prop[Map_Property.caption] ) + "\"\n";
	
	_str += "\n";
}

list_free(_list);

//msg(_str);
var _file = file_text_open_write(get_save_filename("", "mapproperties.ini"));
file_text_write_string(_file, _str); file_text_close(_file);

//*/

#endregion

modData = array_create(8);

if directory_exists("Mods")
{
	var _dir = file_find_first("Mods\\\*", fa_directory), _data;
	
	while (_dir != "")
	{
		_data = loadModData( file_dir_string("Mods", _dir) );
		
		_dir = file_find_next();
	}

	file_find_close();
}

#region Scripts

var _path = file_dir_string(DATADIR, DATANAME),
_dir = file_find_first( _path + "*.tsc", 0 ),
_str = "", _fname, _tempFile;

while (_dir != "")
{
	_str = get_TSC_string(_path + _dir);
	_fname = filename_name(_dir);
	
	_tempFile = file_text_open_write(temp_directory + _fname);
	
	file_text_write_string(_tempFile, _str);
	file_text_close(_tempFile);
		
	_dir = file_find_next();
}

file_find_close();

#endregion

#endregion

eventFlag = array_create(160, 0);

camWidthOffset = (camera_get_view_width(view_camera) - 960) / 2;

#region

username = "Dev";
userface = irandom(29) + 1;

#endregion

playerFlag = [
	setBit(0, Entity_Flag.drawWeapon, Entity_Flag.showDamage), 
	setBit(0, Player_Flag.showGUI)];
	
playerPaletteIndex = 0;

weaponMap = initWeapon();
init_particles();
init_player();

//init_weapon();