/// @desc Updates color if not set to it already
/// @arg color
function draw_update_font(argument0) {

	if draw_get_font() != argument0
	{
		draw_set_font(argument0);
	}


}
