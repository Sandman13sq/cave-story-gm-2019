///
function init_draw() {

	gpu_set_alphatestenable(true);
	gpu_set_alphatestref(1);
	gpu_set_blendenable(false);
	
	/*
	display_set_gui_size(
		camera_get_view_width(view_camera), 
		camera_get_view_height(view_camera));
	*/
		
	var _str = " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz?!/',|:\".<>_*~[]()%&+-";
	for (var i = 128; i < 256; i++) {_str += chr(i)}; //Char.

	// Set Main Font
	global.DreamFont = font_add_sprite_ext(sprfnt_ds, _str, true, 1);
	global.MainFont = global.DreamFont;
#macro FONT_MAIN global.MainFont
#macro FONT_MAIN_SCALE (draw_get_font() == global.DreamFont? DREAMFONT_SCALE: CAVEFONT_SCALE)
#macro DREAMFONT_SCALE 2
#macro CAVEFONT_SCALE 0.5
	draw_update_font(FONT_MAIN);
	
	// Set Small Font
	var _str = "0123456789/-";
	global.SmallFont = font_add_sprite_ext(sprfnt_small, _str, false, 1);
#macro FONT_SMALL global.SmallFont

	// Set Mini Font
	var _str = "0123456789:/-+";
	global.MiniFont = font_add_sprite_ext(sprfnt_mini, _str, true, 2);
#macro FONT_MINI global.MiniFont

	pal_swap_init_system( shd_pal_swapper );


}
