/// @desc 
draw_reset();

draw_shape_rect_wh(
	x - 1, y - 1,
	(tileWidth * tileUnit) + 2,
	((tileCount div tileWidth) * tileUnit) + 2,
	c_missileBlue, 1
	);
	
draw_shape_rect_wh(
	x, y,
	(tileWidth * tileUnit),
	((tileCount div tileWidth) * tileUnit),
	c_caveBlack, 1
	);
	
var _x, _y, _typeCount = ds_list_size(tileType);

for (var i = 0; i < tileCount; i++)
{
	_x = x + (i mod tileWidth) * tileUnit;
	_y = y + (i div tileWidth) * tileUnit;
	
	draw_tile(tileset, i, 0, _x, _y);
		
	if i < _typeCount
	{
		if drawColl
		{
			draw_tile(prt_collision, tileType[| i], 0, _x, _y);
		}
		Dtext_scale(_x, _y, hex(tileType[| i]),
			0.5, 0.5);
	}
}

draw_shape_rect_wh(
	x + (select mod tileWidth) * tileUnit,
	y + (select div tileWidth) * tileUnit,
	tileUnit, tileUnit, c_aqua, 0.2
	);
	
draw_shape_rect_wh(
	x + (current mod tileWidth) * tileUnit,
	y + (current div tileWidth) * tileUnit,
	tileUnit, tileUnit, c_orange, 0.2
	);

Dtext(0, 0, tileset_get_name(tileset) + "\n" + path);