/// @desc 

if !fadeRadius < CAMERA_W
{
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	draw_surface(fadeSurf, 0, 0);
	gpu_set_blendmode(bm_normal);
}

//draw_string_list(40, 40, fadeIn, ready, fadeStep, room);