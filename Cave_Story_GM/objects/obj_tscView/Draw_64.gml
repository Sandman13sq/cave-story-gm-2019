/// @desc 

draw_reset();
draw_update_font(FONT_MAIN);
draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, c_black, 0.5);

draw_text_transformed(x, y, eventString, 0.5, 0.5, 0);

draw_update_color(c_hp);
draw_text_transformed(x, y, eventStringRead, 0.5, 0.5, 0);