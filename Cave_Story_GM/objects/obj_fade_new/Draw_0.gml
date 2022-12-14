/// @desc 
if !surface_exists(fadeSurf)
{
	fadeSurf = surface_create(CAMERA_W, CAMERA_H);
	surface_set_target(fadeSurf);
	draw_clear_alpha(c_white, 1);
	surface_reset_target();
}

surface_set_target(fadeSurf);

if fadeStep
{
	draw_shape_rect_wh(0, 0, CAMERA_W, CAMERA_H, 0, 1);
	
	draw_update_color(c_white);
	var _ang = fadeAngle;
	
	draw_triangle(
		x - fadeRadius * dcos(_ang), y - fadeRadius * dsin(_ang), // Right
		x - fadeRadius * dcos(_ang + 90), y - fadeRadius * dsin(_ang + 90), // Up
		x - fadeRadius * dcos(_ang + 180), y - fadeRadius * dsin(_ang + 180), // Left
		false);
	draw_triangle(
		x - fadeRadius * dcos(_ang + 180), y - fadeRadius * dsin(_ang + 180), // Left
		x - fadeRadius * dcos(_ang + 270), y - fadeRadius * dsin(_ang + 270), // Down
		x - fadeRadius * dcos(_ang), y - fadeRadius * dsin(_ang), // Right
		false);
}

surface_reset_target();