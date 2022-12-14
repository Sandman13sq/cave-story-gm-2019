///
function init_draw1() {
	/*
	application_surface_draw_enable(false);

	gpu_set_alphatestenable(true);
	gpu_set_alphatestref(1);
	gpu_set_blendenable(false);

	// Main text Font
	var _str = " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz?!/',|:-.<>_*~[]()%&";
	for (var i = 128; i < 256; i++) {_str += chr(i)};

	global.mainFont = font_add_sprite_ext(sprfnt_0, _str, 1, 1);
#macro FONT_MAIN global.mainFont
	draw_update_font(global.mainFont);
#macro TEXT_SEP 14

	global.damageFont = font_add_sprite_ext(sprfnt_1, "0123456789!", 1, 1);
#macro FONT_DAMAGE global.damageFont

	//pal_swap_init_system( shd_pal_swapper );

	//shader_set( shd_default );

/* end init_draw1 */
}
