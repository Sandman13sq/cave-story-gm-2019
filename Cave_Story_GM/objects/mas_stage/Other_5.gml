/// @desc Clear Grid

var _l = stageLayerCount, _data;

for (var i = 0; i < _l; i++)
{
	_data = stageLayer[i];
	
	ds_grid_destroy(_data[Stage_Map.grid]);
}

stageLayerCount = 0;

ds_grid_clear(COLLMAP, 0);
ds_grid_resize(COLLMAP, 0, 0);