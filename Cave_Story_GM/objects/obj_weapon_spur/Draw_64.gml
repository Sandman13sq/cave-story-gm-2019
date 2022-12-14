/// @desc 

if instance_exists(SOURCE)
{
	if starAlpha > 0
	{
		draw_set_halign(1);
		draw_set_valign(2);
		draw_update_alpha(starAlpha);
		
		var _x = SOURCE.x + SOURCE.center_x - 40 - CAMERA_X, 
		_y = SOURCE.y + SOURCE.y_up - 20 - CAMERA_Y;
		
		draw_update_font(FONT_MINI);
		draw_update_color(chargeColor);
		draw_text(_x + 40, _y, chargeMode + 1)
		
		draw_sprite(spr_UImeter, 4, _x, _y);
		
		if chargeMode == 2 && chargePosition[chargeMode] == chargeMax[chargeMode]
		{
			draw_sprite(spr_UImeter, 6, _x, _y);
		}
		else
		{
			draw_sprite_stretched(spr_UImeter, 5, _x, _y, 
				(chargePosition[chargeMode] / chargeMax[chargeMode]) * 80, 16);
		}
	}
}