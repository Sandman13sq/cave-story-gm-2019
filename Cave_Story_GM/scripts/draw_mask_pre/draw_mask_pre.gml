/// @desc Used right before drawing a mask
function draw_mask_pre() {

	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false,false,false,true);
	draw_update_alpha(0);
	//draw_clear_alpha(c_black, 0);
	draw_shape_rect_wh(0, 0, room_width, room_height, 0, false);


}
