/// @desc 
draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, Col.caveBlack, alpha);

draw_reset();

draw_set_halign(fa_center);

var _sep = 28, _w = 320;

if disclaimerAlpha[0] > 0
{
	draw_update_alpha(disclaimerAlpha[0]);
	Dtext_ext(CAMERA_W / 2, 140, disclaimerString[0], _sep, _w);
}

if disclaimerAlpha[1] > 0
{
	draw_update_alpha(disclaimerAlpha[1]);
	Dtext_ext(CAMERA_W / 2, 280, disclaimerString[1], _sep, _w);
}