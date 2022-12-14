/// @desc 

// Inherit the parent event
//event_inherited();

//draw_sprite

draw_reset();

var _t = 2, _r = 16, _x = x + 16, _y = y, _h = 32,
_shineCol = merge_color(c_white, c_black, abs(dcos(theta))),
_shineAlpha = abs(dcos(theta)) / 2, _theta = theta mod 180;

if theta < 180
{		
	draw_sprite_pos(spr_save, 0, 
		_x - dsin(_theta + 90) * _t, _y, // Top
		_x + dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2, // Right
		_x - dsin(_theta + 90) * _t, _y + _h, // Bottom
		_x - dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2, // Left
		1);
	
	if _theta < 90
	{
		// Top 
		draw_sprite_pos(spr_saveSide, 2, 
			_x - dsin(_theta + 90) * _t, _y,
			_x + dsin(_theta + 90) * _t, _y,
			_x + dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			_x + dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			1);
			
		// Bottom
		draw_sprite_pos(spr_saveSide, 3, 
			_x + dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			_x + dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			_x + dsin(_theta + 90) * _t, _y + _h,
			_x - dsin(_theta + 90) * _t, _y + _h,
			1);
	}
	else
	{
		// Top 
		draw_sprite_pos(spr_saveSide, 0, 
			_x + dsin(_theta + 90) * _t, _y,
			_x - dsin(_theta + 90) * _t, _y,
			_x - dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			_x - dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			1);
			
		// Bottom
		draw_sprite_pos(spr_saveSide, 2, 
			_x - dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			_x - dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			_x - dsin(_theta + 90) * _t, _y + _h,
			_x + dsin(_theta + 90) * _t, _y + _h,
			1);
	}
		/*
	// Shine
	draw_update_color(_shineCol);
	draw_update_alpha(_shineAlpha);
	draw_polygon_4side(
		_x - dsin(_theta + 90) * _t, _y, // Top
		_x + dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2, // Right
		_x - dsin(_theta + 90) * _t, _y + _h, // Bottom
		_x - dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2, // Left
		);*/
}
else
{	
	draw_sprite_pos(spr_save, 1, 
		_x - dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2, // Left
		_x - dsin(_theta + 90) * _t, _y, // Top
		_x + dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2, // Right
		_x - dsin(_theta + 90) * _t, _y + _h, // Bottom
		1);
		
	if _theta < 90
	{
		// Top 
		draw_sprite_pos(spr_saveSide, 0, 
			_x - dsin(_theta + 90) * _t, _y,
			_x + dsin(_theta + 90) * _t, _y,
			_x + dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			_x + dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			1);
			
		// Bottom
		draw_sprite_pos(spr_saveSide, 2, 
			_x + dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			_x + dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			_x + dsin(_theta + 90) * _t, _y + _h,
			_x - dsin(_theta + 90) * _t, _y + _h,
			1);
	}
	else
	{
		// Top 
		draw_sprite_pos(spr_saveSide, 2, 
			_x + dsin(_theta + 90) * _t, _y,
			_x - dsin(_theta + 90) * _t, _y,
			_x - dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			_x - dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			1);
			
		// Bottom
		draw_sprite_pos(spr_saveSide, 3, 
			_x - dsin(_theta) * _r + dcos(_theta) * _t, _y + _h / 2,
			_x - dsin(_theta) * _r - dcos(_theta) * _t, _y + _h / 2,
			_x - dsin(_theta + 90) * _t, _y + _h,
			_x + dsin(_theta + 90) * _t, _y + _h,
			1);
	}
	/*
	// Shine
	draw_update_color(_shineCol);
	draw_update_alpha(_shineAlpha);
	draw_polygon_4side(
		_x - dsin(theta) * _t, _y, // Top
		_x + dsin(theta) * _r - dcos(theta) * _t, _y + _h / 2, // Right
		_x - dsin(theta) * _t, _y + _h, // Bottom
		_x - dsin(theta) * _r - dcos(theta) * _t, _y + _h / 2, // Left
		);
	*/

}