/// @desc 

var _size = 3/5;

draw_sprite_ext(spr_shape_heart, 0, 
	x + image_xscale * sprite_get_width(sprite_index) / 2,
	y + image_xscale * sprite_get_height(sprite_index) / 2,
	image_xscale * _size, image_yscale * _size, 0, heart_color, 1
	);