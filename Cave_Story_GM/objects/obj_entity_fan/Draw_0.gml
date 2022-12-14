/// @desc 

// Inherit the parent event
//event_inherited();

if DEBUG
{
	draw_reset();

	var _dir = dirAngle(fanDirection),
		_s = (UNIT_PX / 2) - 2;
	
	draw_shape_rect(
		x + center_x - lengthdir_y(_s, _dir), 
		y + center_y + lengthdir_x(_s, _dir), 
		
		x + center_x + lengthdir_y(_s, _dir) + lengthdir_x(range, _dir), 
		y + center_y - lengthdir_x(_s, _dir) + lengthdir_y(range, _dir), 
		c_green, 0.8
		);
}

switch(fanDirection)
{
	case(Dir.right):
		draw_sprite_ext(
			sprite_index, image_index, 
			x, y, 
			image_xscale, image_yscale,
			0, c_white, 1
			);
		break;
		
	case(Dir.up):
		draw_sprite_ext(
			sprite_index, image_index, 
			x, y + UNIT_PX, 
			image_xscale, image_yscale,
			90, c_white, 1
			);
		break;
		
	case(Dir.left):
		draw_sprite_ext(
			sprite_index, image_index, 
			x + UNIT_PX, y + UNIT_PX, 
			image_xscale, image_yscale,
			180, c_white, 1
			);
		break;
		
	case(Dir.down):
		draw_sprite_ext(
			sprite_index, image_index, 
			x + UNIT_PX, y, 
			image_xscale, image_yscale,
			270, c_white, 1
			);
		break;
}