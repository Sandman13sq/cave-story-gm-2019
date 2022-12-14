/// @desc Updates drawing alpha if not set to it already
/// @arg alpha
function draw_update_alpha(argument0) {

	if draw_get_alpha() != argument0
	{
		draw_set_alpha(argument0);
	}


}
