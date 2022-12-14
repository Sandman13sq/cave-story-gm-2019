/// @desc Draws Text Scaled Correctly
/// @arg x,y,string,xscale,yscale
function Dtext_scale(argument0, argument1, argument2, argument3, argument4) {

	draw_text_transformed(argument0, argument1, argument2,
		FONT_MAIN_SCALE * argument3, FONT_MAIN_SCALE * argument4, 0);


}
