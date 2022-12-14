/// @desc Used after drawing whatever on a mask
function draw_mask_post() {

	//gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);

	gpu_set_colorwriteenable(true, true, true, true);


}
