/// @desc 

// Inherit the parent event
//event_inherited();

draw_reset();

var _scale = 2 * radius / sprite_get_width(sprite_index);

draw_sprite_ext(
	sprite_index, 0, 
	x, y, 
	_scale, _scale,
	image_angle, color, 1,
	);

/*

draw_update_color(color);

draw_sprite_pos(
	sprite_index, 0,
	x + radius * dcos(image_angle),
	y + radius * dsin(image_angle),
	
	x + radius * dcos(image_angle + 90),
	y + radius * dsin(image_angle + 90),
	
	x + radius * dcos(image_angle + 180),
	y + radius * dsin(image_angle + 180),
	
	x + radius * dcos(image_angle + 270),
	y + radius * dsin(image_angle + 270),
	1
	);