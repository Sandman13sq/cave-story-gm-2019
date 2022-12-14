/// @desc 

tempScript = ds_map_create();

scriptToMap( getTempString("StageSelect.tsc"), tempScript);

xoff = -sprite_get_width(sprite_index) / 2;
yoff = -sprite_get_height(sprite_index) / 2;

theta = 0;
thetaTarget = 0;
angleSep = 0;
thetaSpeed = 10;
radius = 96;

alpha = 0;

x = CAMERA_W / 2;
y = CAMERA_H / 3;

select = 0;
state = 0;

stageIndex = [];
stageEvent = [];
stageCount = 0;
stageDepthIndex = list_create();

var _stage = TELEPORTER_STAGE,
_key = ds_map_find_first(_stage),
_index = 0;

while (_key != undefined)
{
	stageIndex[_index] = _key;
	stageEvent[_index] = _stage[? _key];
		
	stageX[_index] = 0;
	stageY[_index] = 0;
	stageScale[_index] = 0;
	stageScale[_index] = 1;
	ds_list_add(stageDepthIndex, _index);
	
	_index++;
	stageCount++;
	
	_key = ds_map_find_next(_stage, _key);
}

if stageCount == 0
{
	runEvent(1000, tempScript);
	angleSep = 0
}
else
{
	runEvent(1000 + stageIndex[0], tempScript);
	angleSep = 360 / stageCount;
	
	event_user(0);
}