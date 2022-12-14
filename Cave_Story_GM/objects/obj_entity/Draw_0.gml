/// @desc 

if DEBUG
{
	draw_shape_rect(
		x + x_left,
		y + y_up,
		x + x_right,
		y + y_down,
		c_missileBlue, 0.5
		);
}

if !(flag & 1 << Entity_Flag.hide)
&& (flag & 1 << Entity_Flag.inCamera)
{
	var _shakeX = shakeTimer != 0? (polarize( ( (xstart + CURRENT_FRAME) mod 4) < 2) * 2): 0;
	
	// Do animation if at least one animation exists
	if getBit(flag, Entity_Flag.animates)
	{
		drawAnimation(
			x + sprite_offset_x + width * !image_xflip + _shakeX, 
			y + sprite_offset_y);
		
	}
	// Draw Sprite
	else
	{
		if sprite_exists(sprite_index) 
		{
			draw_sprite(sprite_index, image_index, x + _shakeX, y);
		}
	}
}