/// @desc 
draw_shape_rect_wh(0, 0, CAMERA_W, CAMERA_H, Col.caveBlack, 1);

draw_update_color(c_white);
draw_update_font(fnt_main);
draw_text_ext_transformed(x, y, fileString, 24, CAMERA_W, 0.5, 0.5, 0);