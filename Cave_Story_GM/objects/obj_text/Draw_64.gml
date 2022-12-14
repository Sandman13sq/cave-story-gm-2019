/// @desc 

draw_reset();

// Draw Triangles
var _sep = 4, _s = 16 + _sep, _l;

// Top & bottom
_l = (Text.box_w div _s);
for (var i = 0; i < _l; i++)
{
	draw_sprite(spr_textBox_tri, 0, 
		x + i * _s + borderStep, y);
		
	draw_sprite(spr_textBox_tri, 0, 
		x + (i + 1) * _s - borderStep, y + Text.box_h);
}
// Left & Right
_l = (Text.box_h div _s);
for (var i = 0; i < _l; i++)
{
	draw_sprite(spr_textBox_tri, 0, 
		x, y + (i + 1) * _s - borderStep);
		
	draw_sprite(spr_textBox_tri, 0, 
		x + Text.box_w, y + i * _s + borderStep);
}

// Draw Box
if text_drawBox
{
	draw_shape_rect_wh(
		x, y,
		Text.box_w, Text.box_h,
		rim_col, 1
		);
	
	draw_shape_rect_wh(
		x + Text.box_borderSize,
		y + Text.box_borderSize,
		Text.box_w - Text.box_borderSize * 2,
		Text.box_h - Text.box_borderSize * 2,
		box_col, 1
		);
}
	
draw_update_color(c_white);

// Draw with Face
if faceIndex > 0
{
	draw_surface_ext(text_surf, x + Text.str_xFace, y + Text.str_border, 
		text_scale, text_scale, 0, c_white, 1);
		
	var _palSprite = -1, _palIndex;
	
	if !getBit(FLAGS_GM, GM_Flag.classicFaces)
	{
		switch(faceIndex)
		{
			// Curly Palette
			case(19):
			case(20):
			case(25):
				_palSprite = spl_curly;
				_palIndex = GAME.playerPaletteIndex;
				break;
			
			// Quote Palette
			case(30):
				_palSprite = spl_quote;
				_palIndex = GAME.playerPaletteIndex;
				break;
		}
	}
	
	// Draw with Palette
	if _palSprite != -1
	{
		pal_swap_set(_palSprite, _palIndex, false);
		
		draw_sprite_stretched(faceSprite, faceIndex, 
			x + Text.face_x - faceXOffset, y + Text.face_y,
			Text.face_size, Text.face_size);
			
		pal_swap_reset();
	}
	// Draw normally
	else
	{
		draw_sprite_stretched(faceSprite, faceIndex, 
			x + Text.face_x - faceXOffset, y + Text.face_y,
			Text.face_size, Text.face_size);
	}
}
// Draw without Face
else
{
	draw_surface_ext(text_surf, x + Text.str_x, y + Text.str_border, 
		text_scale, text_scale, 0, c_white, 1);
}

//draw_string_list(x, y, text_newLineCount, text_y_target)