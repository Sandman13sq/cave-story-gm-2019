/// @desc No Draw

if DEBUG
{
	draw_reset();
	draw_string_list(CAMERA_X, CAMERA_Y + 320, 8, 
		CAMERA_X, 
		CAMERA_Y,
		CAMERA_W, 
		CAMERA_H,
		);
}

/*
draw_update_alpha(1);

//shader_set(shd_optimal);
gpu_set_blendenable(false);

draw_surface_stretched(application_surface, 0, 0, 
	CAMERA_W * camera_size, 
	CAMERA_H * camera_size
	);

gpu_set_blendenable(true);

if DEBUG
{
	draw_reset();
	draw_string_list(0, 320,
		CAMERA_X, 
		CAMERA_Y,
		camera_xscale,
		camera_yscale,
		)
}