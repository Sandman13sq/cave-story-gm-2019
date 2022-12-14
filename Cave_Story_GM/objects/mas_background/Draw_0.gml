/// @desc 
draw_reset();

#region Get Background Color from Background Sprite

if !bkColor_top
{
	var _surf = surface_create(2, 2);
	surface_set_target(_surf);
		
	draw_sprite(bkSprite, 0, 0, 0);
	bkColor_top = surface_getpixel(_surf, 0, 0);
		
	draw_sprite(bkSprite, 0, 0, 1 - sprite_get_height(bkSprite));
	bkColor_bottom = surface_getpixel(_surf, 0, 0);
		
	surface_reset_target();
	surface_free(_surf);
}

#endregion

var _x = CAMERA_X, _y = CAMERA_Y;

switch(bkMode)
{
	case(Background_Mode.fixed):
		draw_sprite_tiled(bkSprite, 0, _x, _y);
		break;
		
	case(Background_Mode.parallax):
		draw_sprite_tiled(bkSprite, 0, 
			(_x / 2), 
			(_y / 2)
			);
		break;
		
	default:
		draw_sprite_tiled(bkSprite, 0, _x, _y);
		break;
		
	#region Hide	
	
	case(3):
	case(4):
		draw_clear_alpha(0x200000, 1);
		break;
		
	#endregion
		
	#region Scrolling
	
	case(Background_Mode.scroll):
	case(Background_Mode.scrollLeft):
	case(Background_Mode.scroll_gravity):
		var _w = sprite_get_width(bkSprite), 
		_offX = -x / 8, _offY = (-y / 64);
		
		draw_clear(bkColor_top);
		draw_shape_rect_wh(_x, _y + 400, CAMERA_W, CAMERA_H, bkColor_bottom, 1);
		
		draw_sprite(bkSprite, 0, _x, _y + _offY);
		
		for (var i = -1; i <= 1; i++)
		{
			// Farthest
			draw_sprite_part(bkSprite, 0,
				0, 206, _w, 70, 
				_x - _w * i + loop(bkStep / 16 + _offX, 0, _w), 
				_y + 206 + _offY);
				
			// Second Farthest
			draw_sprite_part(bkSprite, 0,
				0, 276, _w, 46, 
				_x - _w * i + loop(bkStep / 8 + _offX, 0, _w), 
				_y + 276 + _offY);
				
			// Second Closest
			draw_sprite_part(bkSprite, 0,
				0, 322, _w, 60, 
				_x - _w * i + loop(bkStep / 4 + _offX, 0, _w), 
				_y + 322 + _offY);
			
			// Closest
			draw_sprite_part(bkSprite, 0,
				0, 382, _w, 128, 
				_x - _w * i + loop(bkStep + _offX, 0, _w), 
				_y + 382 + _offY);
				
		}
		break;
	
	#endregion
		
	#region Inverted Scroll
	
	case(Background_Mode.scroll_inv):
		var _w = sprite_get_width(bkSprite);
		
		draw_clear(bkColor_bottom);
		draw_shape_rect_wh(_x, _y - CAMERA_H, CAMERA_W, CAMERA_H, bkColor_top, 1);
		draw_sprite(bkSprite, 0, _x, _y);
		
		for (var i = -1; i <= 1; i++)
		{
			// Farthest
			draw_sprite_part(bkSprite, 0,
				0, 264, _w, 72, 
				_x - _w * i + loop(bkStep / 16, 0, _w), 
				_y + 264);
				
			// Second Farthest
			draw_sprite_part(bkSprite, 0,
				0, 218, _w, 46, 
				_x - _w * i + loop(bkStep / 8, 0, _w), 
				_y + 218);
				
			// Second Closest
			draw_sprite_part(bkSprite, 0,
				0, 156, _w, 62, 
				_x - _w * i + loop(bkStep / 4, 0, _w), 
				_y + 156);
			
			// Closest
			draw_sprite_part(bkSprite, 0,
				0, 0, _w, 156, 
				_x - _w * i + loop(bkStep, 0, _w), 
				_y);
				
		}
		break;
		
	#endregion
}

draw_reset();

#region Debug

/*
draw_reset();
draw_update_font(FONT_MAIN);
var _w = sprite_get_width(bkSprite);

draw_string_list(40, 120,
	bkStep,
	loop(bkStep / 16, 0, _w), 
	loop(bkStep / 8, 0, _w), 
	loop(bkStep / 4, 0, _w), 
	loop(bkStep / 1, 0, _w), 
	);
*/

#endregion