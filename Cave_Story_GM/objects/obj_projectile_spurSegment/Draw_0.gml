/// @desc 

// Inherit the parent event
//event_inherited();

draw_sprite_ext(spr_proj_spurLaser, 0, x, y, length, radius, angle, color, 1);

draw_shape_circle(x, y, radius, color, 1);
draw_shape_circle(
	x + lengthdir_x(length, angle), 
	y + lengthdir_y(length, angle), 
	radius, color, 1);