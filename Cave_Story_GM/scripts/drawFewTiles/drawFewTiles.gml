/// @desc Draws a few tiles from stage tileset
/// @arg tiles_per_row,x,y,tile1,tile2,...
function drawFewTiles() {

	var _w = argument[0], _x = argument[1], _y = argument[2],
	_tile = 0, _tilemap = stageLayer_get(0, Stage_Map.tilemapFG),
	_tileset =	tilemap_get_tileset(_tilemap);

	for (var i = 3; i < argument_count; i++)
	{
		draw_tile(_tileset, argument[i], 0,
			_x + (_tile mod _w) * UNIT_PX,
			_y + (_tile div _w) * UNIT_PX
			);
		
		_tile++;
	}


}
