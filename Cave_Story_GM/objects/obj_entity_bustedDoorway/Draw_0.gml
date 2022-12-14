/// @desc 

// Inherit the parent event
//event_inherited();

var _l = array_length(tile), 
_xpos = -1, _ypos = -1;

for (var i = 0; i < _l; i++)
{
	if i == 3 {_ypos++; _xpos = -1};
	
	draw_tile(tileset, tile[i], 0, 
		x + _xpos * UNIT_PX,
		y + _ypos * UNIT_PX
		);
		
	_xpos++;
}