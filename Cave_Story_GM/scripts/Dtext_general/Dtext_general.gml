/// @desc Draws Text Scaled Correctly
/// @arg x,y,string,sep,w,xscale,yscale
function Dtext_general(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	draw_text_ext_transformed(argument0, argument1, argument2, 
		argument3 / FONT_MAIN_SCALE, argument4 / FONT_MAIN_SCALE,
		FONT_MAIN_SCALE * argument5, FONT_MAIN_SCALE * argument6, 0);


}
