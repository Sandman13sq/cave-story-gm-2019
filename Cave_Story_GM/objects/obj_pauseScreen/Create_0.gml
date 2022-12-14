/// @desc 

FREEZE = true;

FLAGS_GAMEPLAY = setBit(FLAGS_GAMEPLAY, Gameplay_Flag.stayFrozen);

clearGameplayFlag(Gameplay_Flag.showGUI);

tempScript = ds_map_create();

scriptToMap( getTempString("ArmsItem.tsc"), tempScript);

x = (CAMERA_W - Menu.w) / 2;
y = ( (CAMERA_H - Menu.h) / 2 ) - 40;

weaponList = getPlayerData(Player_Stat.weapons);
itemList = getPlayerData(Player_Stat.items);

lastItemCount = ds_list_size(itemList);

weaponCurrent = getPlayerData(Player_Stat.current_weapon);

depth = 10000;

#region Enum Menu

enum Menu
{
	w = 480,
	h = 300,
	
	tabH = 48,
	tabW = 128,
	
	wepSep = 40,
	
	itemXsep = 76,
	itemYsep = 48,
	
	itemPerRow = 6,
	itemPerColumn = 5,
}

#endregion

menuSelect = 0;
menuSurf = -1;
menuTabString = ["ARMS", "ITEMS", "OPTIONS"];
menuCount = array_length(menuTabString);

var _s = 4;
select = array_create(_s);
selectOffset = array_create(_s);
y_offset_target = 0;
y_offset = y_offset_target;
state = -1;

var _perPage = 5, _state = 0;
select[_state] = weaponCurrent;
var _push = sign(select[_state] - selectOffset[_state]);
				
while !in_range(select[_state], 
	selectOffset[_state], 
	selectOffset[_state] + _perPage - 1, 
	)
{
	selectOffset[_state] += _push;
}
				
y_offset_target = (selectOffset[_state]) * 40;
y_offset = y_offset_target;

sliceSprite = spr_betaSlice;
highlightStep = 0;

masterVolume = round(audio_get_master_gain(0) * 100);
musicVolume = round(VOLUME_BGM * 100);
sfxVolume = round(VOLUME_SFX * 100);

optionString = [
	"Next Palette", 
	"Prev Palette", 
	"Master Volume",
	"Music Volume",
	"SFX Volume",
	"Switch Character"
	];
	
input_clear(Input.menu, Input.type_pressed);

pantyBit = !irandom(3);