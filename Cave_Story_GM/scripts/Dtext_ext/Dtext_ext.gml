/// @desc Draws Text Scaled Correctly
/// @arg x,y,string,sep,w
function Dtext_ext(argument0, argument1, argument2, argument3, argument4) {

	draw_text_ext_transformed(argument0, argument1, argument2, 
		argument3 / FONT_MAIN_SCALE, argument4 / FONT_MAIN_SCALE,
		FONT_MAIN_SCALE, FONT_MAIN_SCALE, 0);


}
