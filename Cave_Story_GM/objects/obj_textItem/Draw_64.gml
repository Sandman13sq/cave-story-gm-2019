/// @desc 
draw_reset();

// Draw Triangles
var _sep = 4, _s = 16 + _sep;

// Top & bottom
var _l = (Text.itemBox_w div _s);
for (var i = 0; i < _l; i++)
{
	draw_sprite(spr_textBox_tri, 0, 
		x + i * _s + borderStep, y);
		
	draw_sprite(spr_textBox_tri, 0, 
		x + (i + 1) * _s - borderStep, y + Text.itemBox_h);
}
// Left & Right
var _l = (Text.itemBox_h div _s);
for (var i = 0; i < _l; i++)
{
	draw_sprite(spr_textBox_tri, 0, 
		x, y + (i + 1) * _s - borderStep);
		
	draw_sprite(spr_textBox_tri, 0, 
		x + Text.itemBox_w, y + i * _s + borderStep);
}

// Draw Box
draw_shape_rect_wh(
	x, y,
	Text.itemBox_w, Text.itemBox_h,
	rim_col, 1
	);
	
draw_shape_rect_wh(
	x + Text.box_borderSize,
	y + Text.box_borderSize,
	Text.itemBox_w - Text.box_borderSize * 2,
	Text.itemBox_h - Text.box_borderSize * 2,
	box_col, 1
	);
	
// Sprite
draw_sprite(sprite_index, itemIndex, 
	x + Text.itemBox_w / 2 - sprite_get_width(sprite_index) / 2, 
	y + Text.itemBox_h / 2 - sprite_get_height(sprite_index) / 2
	);