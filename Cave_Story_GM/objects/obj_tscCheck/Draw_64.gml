/// @desc 
draw_shape_rect_wh(0, 0, CAMERA_W, 20, Col.caveTextBox, 1);

draw_reset();
Dtext(0, 0, 
	fileName + ", Offset: -" + hex(byteOffset) + 
	", Size: " + string(ds_list_size(fileList)) + " / " + hex(ds_list_size(fileList)) +
	//", Mod Check: " + hex( 128 - ( ( ds_list_size(fileList)) mod 128 )) +
	", New Line: " + string(fileNLcount)
	);