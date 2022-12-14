/// @desc 

// Inherit the parent event
event_inherited();

healAmount = 6;

var _in = 4;
for (var i = 0; i < 3; i++)
{
	heart_x[i] = x + _in + irandom(sprite_get_width(sprite_index) - _in * 2);
	heart_y[i] = y + _in + irandom(sprite_get_height(sprite_index) - _in * 2);
	
	heart_theta[i] = irandom(360);
	heart_color[i] = 0;
	heart_size[i] = 0;
}