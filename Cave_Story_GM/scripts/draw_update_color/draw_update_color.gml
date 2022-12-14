/// @desc Updates color if not set to it already
/// @arg color
function draw_update_color(argument0) {

	if draw_get_color() != argument0
	{
		draw_set_color(argument0);
	}


}
