/// @description draw_reset()
function draw_reset() {
	draw_update_alpha(1);
	draw_update_color(c_white);

	if draw_get_halign() != fa_left
	{
		draw_set_halign(fa_left);
	}

	if draw_get_valign() != fa_top
	{
		draw_set_valign(fa_top);
	}

	draw_update_font(FONT_MAIN);

	if shader_current() != shd_default
	{
		shader_set(shd_default);
	}


}
