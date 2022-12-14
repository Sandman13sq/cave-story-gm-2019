/// @desc 

var _in = 64, _ysep = 32, _w = 128, _y, _barW =_w - 20;

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

for (var i = 0; i < menuSize; i++)
{
	_y = y + (i * _ysep);
	
	switch(i)
	{
		case(Intro_Option_State.masterVolume):
			draw_update_color(select == i? c_black: c_white);
			Dtext_scale(x, _y, menuStr[i] + "   "+ string(masterVolume), 0.5, 0.5);
			draw_UIbar(spr_UIbar, c_white, x - _barW, _y + _ysep - 20, _barW * 2, masterVolume, 255);
			break;
		
		case(Intro_Option_State.musicVolume):
			draw_update_color(select == i? c_black: c_white);
			Dtext_scale(x, _y, menuStr[i] + "   "+ string(musicVolume), 0.5, 0.5);
			draw_UIbar(spr_UIbar, c_white, x - _barW, _y + _ysep - 20, _barW * 2, musicVolume, 255);
			break;
			
		case(Intro_Option_State.sfxVolume):
			draw_update_color(select == i? c_black: c_white);
			Dtext_scale(x, _y, menuStr[i] + "   "+ string(sfxVolume), 0.5, 0.5);
			draw_UIbar(spr_UIbar, c_white, x - _barW, _y + _ysep - 20, _barW * 2, sfxVolume, 255);
			break;
	
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
		case(Intro_Option_State.leave):
			draw_update_color(select == i? c_black: c_white);
			Dtext(x, _y, menuStr[i]);
			break;
	}
}