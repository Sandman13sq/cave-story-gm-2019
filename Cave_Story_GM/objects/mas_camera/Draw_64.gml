/// @desc 

draw_update_alpha(1);

//shader_set(shd_optimal);
gpu_set_blendenable(false);

draw_surface_stretched(application_surface, 0, 0, 
	display_get_gui_width(), 
	display_get_gui_height()
	);

gpu_set_blendenable(true);

/*
//if !FREEZE
{
	//if surface_exists(freezeSurface) 
	{
		//surface_free(freezeSurface); 
		//mass_activate(true);
	}
	/*
	draw_surface_part_ext(
		application_surface, camera_surf_x, camera_surf_y, 
		CAMERA_W, CAMERA_H, 
		0, 0, 
		1, 1, //camera_size, camera_size, 
		c_white, 1
		)
	//*/
	
	//draw_surface_part(application_surface, -90, -90, 960, 540,
	//	camera_surf_x, camera_surf_y)
	
	/*
	draw_surface_stretched(application_surface, 0, 0, 
		CAMERA_W * camera_size, 
		CAMERA_H * camera_size
		);
	//*/
//}
/*
else
{
	if !surface_exists(freezeSurface)
	{
		mass_activate(true);
		
		freezeSurface = surface_create(
			surface_get_width(application_surface), 
			surface_get_height(application_surface));
		surface_copy(freezeSurface, 0, 0, application_surface);
		
		mass_activate(false);
	}
	
	draw_surface_stretched(freezeSurface, 0, 0, CAMERA_W, CAMERA_H);
	/*
	draw_surface_stretched(freezeSurface, 0, 0,
		display_get_gui_width(), 
		display_get_gui_height()
		);
}
*/

gpu_set_blendenable(true);
/*
//shader_reset();

draw_reset();
draw_update_font(FONT_MAIN);
var _cam = camera_current, _view = view_current;

draw_set_halign(fa_right);
draw_string_list(CAMERA_W, 0,
	camera_get_view_x(_cam),
	camera_get_view_y(_cam),
	camera_get_view_width(_cam),
	camera_get_view_height(_cam),
	"",
	view_get_xport(_view),
	view_get_yport(_view),
	view_get_wport(_view),
	view_get_hport(_view),
	"",
	camera_x_speed,
	)