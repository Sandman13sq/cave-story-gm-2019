/// @desc Draw Music

draw_reset();

draw_set_halign(1);
draw_set_valign(0);

draw_box_wh(x, y, width, height, 4, Col.caveTextBox, Col.caveTextRim);
Dtext(CAMERA_W / 2, y + 4, musicString);