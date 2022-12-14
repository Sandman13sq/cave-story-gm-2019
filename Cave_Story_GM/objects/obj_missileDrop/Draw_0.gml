/// @desc 

var _w = sprite_get_width(sprite_index),
_h = sprite_get_height(sprite_index),
_angle = 45;
	
draw_sprite_ext(spr_missileFlash, 0,
	x + image_xscale * _w / 2,
	y + image_xscale * _h / 2,
	image_xscale, image_yscale, _angle, missile_color, 1
	);
	
draw_sprite_ext(spr_proj_missileSmall, image_index,
	x + image_xscale * _w / 2,
	y + image_xscale * _h / 2,
	image_xscale, image_yscale, _angle, c_white, 1
	);