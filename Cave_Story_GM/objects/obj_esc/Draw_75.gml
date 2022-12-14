/// @desc 
draw_reset();
draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, Col.caveBlack, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_update_font(FONT_MAIN);

Dtext_ext(x, y, "ESC: Quit\nF1: Resume\nF2: Reset", 30, 400);

