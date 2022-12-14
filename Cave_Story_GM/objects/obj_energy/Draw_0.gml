/// @desc 
//draw_self();

var _angleSep = 360 / 3, _size = size;

draw_reset();
draw_update_color(image_blend);
draw_triangle(
	x + _size * dcos(image_angle),
	y + _size * dsin(image_angle),
	
	x + _size * dcos(image_angle + _angleSep),
	y + _size * dsin(image_angle + _angleSep),
	
	x + _size * dcos(image_angle + _angleSep * 2),
	y + _size * dsin(image_angle + _angleSep * 2),
	false);