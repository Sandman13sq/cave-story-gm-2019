/// @desc 

var _y = 0, _h = 24;

draw_reset();
draw_update_font(FONT_MINI);
draw_set_halign(1);
draw_set_valign(1);

for (var i = 0; i < 4; i++)
{
	if active[i]
	{
		draw_update_color(c_black);
		
		// Positive number (add a "+")
		if value[i] > 0
		{
			draw_text_transformed(x + 2, y + _y + 2, "+" + string(value[i]), 1, height[i], 0);
			draw_update_color(flash[i] mod 4 == 0? color[i]: c_white);
			draw_text_transformed(x, y + _y, "+" + string(value[i]), 1, height[i], 0);
		}
		else
		{
			draw_text_transformed(x + 2, y + _y + 2, value[i], 1, height[i], 0);
			draw_update_color(flash[i] mod 4 == 0? color[i]: c_white);
			draw_text_transformed(x, y + _y, value[i], 1, height[i], 0);
		}
		
		_y -= _h;
	}
}