/// @desc 

// Inherit the parent event
//event_inherited();

draw_reset();
	
draw_shape_circle(
	x + lengthdir_x(lengthStart, direction),
	y + lengthdir_y(lengthStart, direction),
	radius, color, 1
	);
	
draw_shape_circle(
	x + lengthdir_x(lengthEnd, direction),
	y + lengthdir_y(lengthEnd, direction),
	radius, color, 1
	);
	
// Draw Start
if laserLife
{
	draw_shape_circle(x, y, pulseRadius + 4, pulseColor, 1);
	draw_shape_circle(x, y, pulseRadius, color, 1);
}

var _length = lengthEnd - lengthStart;

draw_sprite_ext(
	spr_proj_spurLaser, 0, 
	x + lengthdir_x(lengthStart, direction),
	y + lengthdir_y(lengthStart, direction),
	_length, radius,
	direction, color, 1
	);