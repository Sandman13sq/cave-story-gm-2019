/// @desc 

var _in = 64, _ysep = 32, _w = 256, _y;

draw_box(_in, _in, CAMERA_W - _in, CAMERA_H - _in, 4, 
	beta? Col.betaTextBox: Col.caveTextBox,
	beta? Col.betaTextRim: Col.caveTextRim);

draw_reset();

// Draw Box Behind Selection
draw_shape_rect(
	x - _w, 
	y + (select * _ysep) - 4, 
	x + _w, 
	y + (select + 1) * _ysep - 4, 
	c_white, 1);
	
draw_set_halign(1);
draw_update_font(FONT_MAIN);

for (var i = 0; i < menuSize; i++)
{
	_y = y + (i * _ysep);
	
	switch(i)
	{
		// Draw Text With Check
		default:
			draw_update_color(select == i? c_black: c_white);
			if draw_get_font() == fnt_main // Courier
			{
				Dtext(x, _y, menuStr[i] + (menuCheck[i]? "[Active]": "[Inactive]"));
			}
			else // Dream Story
			{
				Dtext(x, _y, menuStr[i] + chr(menuCheck[i]? Char.check_on: Char.check_empty));
			}
			break;
			
		// Draw Text Without Check
		case(Intro_GMsettings_State.leave):
			draw_update_color(select == i? c_black: c_white);
			Dtext(x, _y, menuStr[i]);
			break;
	}
}