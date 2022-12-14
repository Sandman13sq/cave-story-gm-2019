/// @desc 

// Inherit the parent event
event_inherited();

/*
// Tile Collision
var _interval = 0.5, _x, _y, _r = 2;
for (var i = -1; i < 1; i += _interval)
{
	_x = x + lengthdir_x(radius * i, direction);
	_y = y + lengthdir_y(radius * i, direction);
	
	draw_shape_circle(
		_x, _y, _r, c_green, 1
		);
		
	draw_shape_circle(
		_x - lengthdir_x(width, direction - 90),
		_y - lengthdir_y(width, direction - 90),
		_r, c_orange, 1
		);
		
	draw_shape_circle(
		_x + lengthdir_x(width, direction - 90),
		_y + lengthdir_y(width, direction - 90),
		_r, c_orange, 1
		);
}