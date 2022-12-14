/// @desc 

// Inherit the parent event
event_inherited();

var _scale = 2 * radius / sprite_get_width(sprite_index);

with create_effect_bulletFade(spr_shape_squareFrame, 
	image_speed, image_angle, 3, trailColor_start, trailColor_end)
{
	image_xscale = _scale;
	image_yscale = _scale;
}

x += dsin(direction) * dcos(theta) * amplitude;
y += dcos(direction) * dcos(theta) * amplitude;

theta = loop(theta + thetaSpeed, 0, 360);