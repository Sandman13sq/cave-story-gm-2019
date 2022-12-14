/// @desc 

// Litter tiles around edge
var _s = 8;
for (var i = 0; i < _s; i++)
{
	for (var j = -_s; j < width + _s; j++)
	{
		draw_tile(tileset, tile, 0, j * UNIT_PX, -(i + 1) * UNIT_PX);
		draw_tile(tileset, tile, 0, j * UNIT_PX, (i + height + 1) * UNIT_PX);
	}
}