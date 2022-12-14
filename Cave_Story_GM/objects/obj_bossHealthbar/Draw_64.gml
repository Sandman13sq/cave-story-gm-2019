/// @desc 

draw_reset();
	
var _spr = sprite_index;

draw_sprite_stretched(_spr, 0, x, y, width, sprite_height);
draw_sprite_stretched(_spr, 3, x, y, healthShow, sprite_height);
draw_sprite_stretched(_spr, 1, x, y, healthReal, sprite_height);
draw_sprite(_spr, 2, x + width, y);