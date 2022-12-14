/// @desc 

var _w = 8;

if shineBuffer
{
	draw_shape_hoop(
		MY_X, MY_Y, 0, radius + _w, 360, 360 / 12, 6, 1
		);
}
else
{
	var _r = radius / floor(shineFrame);
	
	draw_shape_hoop(
		MY_X, MY_Y, _r, _r + _w, 360, 360 / 12, 6, 1
		);
}

/*

shader_reset();

draw_update_color(c_green);
draw_line_width(MY_X, MY_Y, 
	MY_X + lengthdir_x(48, reflectAngle),
	MY_Y + lengthdir_y(48, reflectAngle),
	2
	);
	
draw_update_color(c_orange);
draw_line_width(MY_X, MY_Y, 
	MY_X + lengthdir_x(48, contactAngle),
	MY_Y + lengthdir_y(48, contactAngle),
	2
	);