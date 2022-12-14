/// @desc Update Layers & Tiles

var _lyr = layer_get_all(), _count = array_length(_lyr),
_str, _lyrIndex = 0;

stageLayerCount = 0;

setStageCollisionLayer(layer_create(LyrDepth.collision));

// Read Layers in reverse (To preserve depth order)
for (var _lyrIndex = _count - 1; _lyrIndex > 0; _lyrIndex--)
{
	_str = string_lower(layer_get_name(_lyr[_lyrIndex]));
	
	// Foreground Tiles
	if _str == "fg" || _str = "tiles_fg" || _str = "tile_fg"
	{
		layer_depth(_lyr[_lyrIndex], LyrDepth.foreground);
		STAGE.tileLayerFG[0] = _lyr[_lyrIndex];
	}
	
	// Background Tiles
	if _str == "bg" || _str = "tiles_bg" || _str = "tile_bg"
	{
		layer_depth(_lyr[_lyrIndex], LyrDepth.background);
		STAGE.tileLayerBG[0] = _lyr[_lyrIndex];
	}
	
	// Background
	if _str == "background" || _str = "bk"
	{
		// Disregard layer if setBackground() has been called
		if instance_exists(mas_background)
		{
			layer_destroy(_lyr[_lyrIndex]);
		}
		// Set background to proper depth
		else
		{
			layer_depth(_lyr[_lyrIndex], LyrDepth.maxBack);
		}
	}
	
	// Tiles
	if string_pos("map", string_copy(_str, 1, 3)) > 0
	{
		with STAGE
		{
			var _mapIndex = stageLayerCount,
			_tmap = layer_tilemap_get_id(_lyr[_lyrIndex]),
			_tileset = tilemap_get_tileset(_tmap),
			_width = tilemap_get_width(_tmap),
			_height = tilemap_get_height(_tmap),
			_x, _y, _mapData;
			
			_mapData = stageLayer_create(_mapIndex, _tileset, _width, _height);
			
			ds_grid_resize(COLLMAP, 
				max(ds_grid_width(COLLMAP), _width),
				max(ds_grid_height(COLLMAP), _height),
				);
			
			/*
			tilemapTakeover(_tmapFG, LyrDepth.foreground);
			tilemapTakeover(_tmapBG, LyrDepth.background);
			
			layer_set_visible(_lyrFG, false);
			layer_set_visible(_lyrBG, false);
			*/
			
			#region Load Tile Type
			
			var _str = tileset_get_name(_tileset), _path = "", _type = array_create(256);
			_str = string_replace(_str, "prt_", "");
			_str = string_upper(string_char_at(_str, 1)) + string_copy(_str, 2, string_length(_str) - 1);
			
			_path = filesearch(_str + ".pxa", file_dir_string(DATADIR, DATANAME, "Stage"));
			
			if _path != ""
			{
				var _file = file_bin_open(_path, 0), 
				_l = file_bin_size(_file);
				
				_type = array_create(_l);
				
				for (var j = 0; j < _l; j++)
				{
					_type[j] = byteRead_integer(_file, 1, false);
				}
				
				stageLayer_set_tileType(_mapIndex, _type);
				
				file_bin_close(_file);
				
				// Apply Tile Types
				var _tile;
				for (var _y = 0; _y < _height; _y++)
				{
					for (var _x = 0; _x < _width; _x++)
					{
						_tile = tile_get_index(tilemap_get(_tmap, _x, _y));
						
						if _tile > 0
						{
							changeStageTile(_mapIndex, _x, _y, _tile);
						}
					}
				}
			}
			
			#endregion
			
			stageLayerCount++;
			
			layer_set_visible(_lyr[_lyrIndex], false);
		}
	}
}