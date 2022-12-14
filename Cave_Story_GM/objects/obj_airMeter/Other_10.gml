/// @desc Update position

// Source is player

if instance_exists(SOURCE)
{
	var _w = 64, _h = 64, _y = -64;

	x = clamp(getCenterX(SOURCE) - CAMERA_X, _w, CAMERA_W - _w);
	y = clamp(getCenterY(SOURCE) - CAMERA_Y + _y, _h, CAMERA_H - _h);

	if timer > 0
	{
		timer--;
	}
	else
	{
		timer = airFrames;
		airCount--;
	
		if airCount == 0
		{
			var _src = SOURCE;
		
			with _src
			{
				setAnimation(Sequence_player.hurt);
				updateAnimation();
			}
	
			with instance_create_depth(
				_src.x, 
				_src.y, 
				0, obj_player_drown)
			{
				sprite_index = _src.sprite_index;
				image_index = _src.image_index;
				image_xscale = _src.image_xscale;
				image_yscale = _src.image_yscale;
		
				animationXFlip = _src.animationXFlip;
				animationXOffset = _src.animationXOffset;
				animationYOffset = _src.animationYOffset;
				animationColor = _src.animationColor;
				animationPalIndex = _src.animationPalIndex;
				animationPalSprite = _src.animationPalSprite;
				image_xflip = _src.image_xflip;
		
				x_offset = _src.sprite_offset_x + _src.width * !_src.image_xflip;
				y_offset = _src.sprite_offset_y;
		
				center_x = _src.center_x;
				center_y = _src.center_y;
			}
		
			instance_destroy(_src);
			instance_destroy();
		}
	}
}
else
{
	instance_destroy();
}