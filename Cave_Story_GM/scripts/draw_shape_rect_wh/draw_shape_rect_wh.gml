/// @desc Draws rectangle using sprite
/// @arg x,y,w,h,col,alpha
function draw_shape_rect_wh(argument0, argument1, argument2, argument3, argument4, argument5) {

	draw_sprite_stretched_ext(spr_shape_square, 0, 
		argument0, argument1, 
		argument2, argument3,
		argument4, argument5
		);


}
