/// @desc 

draw_reset();

draw_shape_rect_wh(CAMERA_X, CAMERA_Y, CAMERA_W, CAMERA_H, 0x110000, alpha);

if !state
{
	var _x = x + animationXOffset + x_offset, 
	_y = y + animationYOffset + y_offset;
	
	pal_swap_set(animationPalSprite, animationPalIndex, false);
	
	draw_sprite_ext(
		sprite_index, image_index, _x, _y,
		image_xscale * animationXFlip * (image_xflip? 1: -1), 
		image_yscale, 0, 
		animationColor, 1
		);
	
	draw_update_alpha(alpha);
	//shader_set(shd_dark);
	
	draw_sprite_ext(
		sprite_index, image_index, _x, _y,
		image_xscale * animationXFlip * (image_xflip? 1: -1), 
		image_yscale, 0, 
		0xFF4444, alpha
		);
		
	pal_swap_reset();
}

//shader_reset();