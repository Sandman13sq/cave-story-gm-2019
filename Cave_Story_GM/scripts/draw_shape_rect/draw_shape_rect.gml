/// @desc Draws rectangle using sprite
/// @arg x1,y1,x2,y2,col,alpha
function draw_shape_rect(argument0, argument1, argument2, argument3, argument4, argument5) {

	draw_sprite_stretched_ext(spr_shape_square, 0, 
		argument0, argument1, 
		argument2 - argument0, argument3 - argument1,
		argument4, argument5
		);


}
