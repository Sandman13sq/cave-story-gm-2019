/// @desc Draw Sprite
draw_reset();

draw_sprite_ext(
	sprite_index, image_index, 
	x, y, image_xscale * image_xflip, image_yscale,
	direction, c_white, 1
	);