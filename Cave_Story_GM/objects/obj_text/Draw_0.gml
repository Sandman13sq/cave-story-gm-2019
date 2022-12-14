/// @desc Draw Text on Surface

if !surface_exists(text_surf)
{
	text_surf = surface_create(Text.str_w / text_scale, Text.str_h / text_scale);
}

draw_reset();
draw_update_font(FONT_MAIN);

surface_set_target(text_surf);

	draw_clear_alpha(c_black, 0);

	// Draw Text on Surface
	draw_text_ext(0, text_y, 
		string_copy(text_str, 1, text_pos), 
		Text.str_sep / text_scale, 
		Text.str_w / text_scale
		);

surface_reset_target();