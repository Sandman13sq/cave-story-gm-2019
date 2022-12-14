/// @desc 

draw_reset();

var _x1 = clamp(x + display_l, 0, width), _x2 = clamp(x + display_r, 0, width),
_y1 = clamp(y + display_u, 0, height), _y2 = clamp(y + display_d, 0, height);

for (var i = _y1; i < _y2; i++)
{
	for (var j = _x1; j < _x2; j++)
	{
		draw_tile(
			tileset, 
			tilemap_get(tilemap, j, i), 0, 
			j * UNIT_PX,
			i * UNIT_PX
			);
	}
}