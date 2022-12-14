/// @desc Sets up stage layer
/// @arg index,tileset,width,height,*tiletype
function stageLayer_create() {

	with STAGE
	{
		var i = argument[0], _tileset = argument[1],
		_width = argument[2], _height = argument[3],
		_tileType = argument_count > 4? argument[4]: array_create(256),
		_data = array_create(8);
	
		_data[Stage_Map.grid] = ds_grid_create(_width, _height);
		_data[Stage_Map.type] = _tileType;
	
		_data[Stage_Map.layerFG] = layer_create(LyrDepth.foreground);
		_data[Stage_Map.layerBG] = layer_create(LyrDepth.background);
	
		_data[Stage_Map.tilemapFG] = layer_tilemap_create(_data[Stage_Map.layerFG], 
			0, 0, _tileset, _width, _height);
		
		_data[Stage_Map.tilemapBG] = layer_tilemap_create(_data[Stage_Map.layerBG], 
			0, 0, _tileset, _width, _height);
	
		stageLayer[i] = _data;
		
		return stageLayer[i];
	}


}
