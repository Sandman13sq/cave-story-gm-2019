/// @desc 
	
var _x = x + sprite_offset_x,
_y = y + sprite_offset_y,
_shakeX = shakeTimer? (polarize(shakeTimer mod 4 < 2) * 2): 0;

draw_sprite_ext(
	sprite_index, image_index, 
	_x + animationXOffset + _shakeX, 
	_y + animationYOffset,
	image_xscale,
	image_yscale, 0, 
	animationColor, image_alpha
	);