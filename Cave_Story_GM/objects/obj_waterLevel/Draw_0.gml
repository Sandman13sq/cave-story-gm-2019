/// @desc 
draw_reset();

if !surface_exists(waterSurface)
{
	waterSurface = surface_create(waterSurfaceW, waterSurfaceH);
	surface_set_target(waterSurface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}

var _x = CAMERA_X, _sep = 16,
_y = y - CAMERA_Y + CAMERA_H / 2;

surface_set_target(waterSurface);
	for (var i = 0; i < 8; i++)
	{
		draw_update_alpha(0.5);
		draw_sprite(spr_water, 0, loop(-_x / 16 + i * _sep, -_sep, waterSurfaceW), 0);
		draw_update_alpha(0.6);
		draw_sprite(spr_water, 0, loop(-_x / 13 + i * _sep, -_sep, waterSurfaceW), 16);
		draw_update_alpha(0.7);
		draw_sprite(spr_water, 0, loop(-_x / 10 + i * _sep, -_sep, waterSurfaceW), 32);
		draw_update_alpha(0.8);
		draw_sprite(spr_water, 0, loop(-_x / 08 + i * _sep, -_sep, waterSurfaceW), 48);
		draw_update_alpha(0.9);
		draw_sprite(spr_water, 0, loop(-_x / 04 + i * _sep, -_sep, waterSurfaceW), 64);
		draw_update_alpha(1.0);
		draw_sprite(spr_water, 0, loop(-_x / 02 + i * _sep, -_sep, waterSurfaceW), 96);
	}
surface_reset_target();

if underWater
{
	draw_surface_stretched_ext(
		waterSurface, _x, y - waterDrawH, CAMERA_W, abs(waterDrawH), Col.water, 0.9);
}
else
{
	draw_surface_stretched_ext(
		waterSurface, _x, y, CAMERA_W, abs(waterDrawH), Col.water, 0.7);
}

// Front
/*
if underWater
{
	draw_surface_stretched_ext(
		waterSurface, _x, y, CAMERA_W, abs(waterDrawH), c_green, 0.5);
}
else
{
	draw_surface_stretched_ext(
		waterSurface, _x, y + waterDrawH, CAMERA_W, abs(waterDrawH), c_aqua, 0.5);
}