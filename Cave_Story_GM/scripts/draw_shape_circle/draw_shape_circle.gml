/// @desc Draws circle using sprite
/// @arg x,y,r,col,alpha
function draw_shape_circle(argument0, argument1, argument2, argument3, argument4) {

	var _x = argument0, _y = argument1, _r = argument2;

	draw_sprite_stretched_ext(spr_shape_circle, 0, 
		_x - _r, _y - _r, 
		_r * 2, _r * 2,
		argument3, argument4
		);


}
