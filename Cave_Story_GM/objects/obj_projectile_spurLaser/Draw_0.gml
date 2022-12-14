/// @desc 

// Inherit the parent event
//event_inherited();

draw_reset();
	
draw_shape_circle(x, y, radius, color, 1);
	
// Draw Start
if laserLife
{
	draw_shape_circle(xstart, ystart, pulseRadius + 4, pulseColor, 1);
	draw_shape_circle(xstart, ystart, pulseRadius, color, 1);
}

var _length = point_distance(x, y, cutX, cutY);

draw_sprite_ext(spr_proj_spurLaser, 0, cutX, cutY, _length, radius, direction, color, 1);