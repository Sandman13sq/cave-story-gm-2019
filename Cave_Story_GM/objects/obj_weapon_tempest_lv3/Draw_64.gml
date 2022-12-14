/// @desc 

if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.showGUI)

if instance_exists(SOURCE)
{
	if chargeAlpha > 0
	{
		draw_update_alpha(chargeAlpha);
		
		var _x = SOURCE.x + SOURCE.center_x - 40 - CAMERA_X, 
		_y = SOURCE.y + SOURCE.y_up - 20 - CAMERA_Y;
		
		draw_sprite(spr_UImeter, 4, _x, _y);
		
		if charge == chargeMax
		{
			draw_sprite(spr_UImeter, 6, _x, _y);
		}
		else
		{
			draw_sprite_stretched(spr_UImeter, 5, _x, _y, 
				(charge / chargeMax) * 80, 16);
		}
	}
}