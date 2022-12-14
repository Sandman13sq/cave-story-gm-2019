/// @desc 

var _size;

for (var i = 0; i < 3; i++)
{
	_size = heart_size[i];
	
	draw_sprite_ext(spr_shape_heart, 0, 
		heart_x[i],
		heart_y[i],
		image_xscale * _size, image_yscale * _size, 0, heart_color[i], 1
		);
}