/// @desc Draws text with drop shadow
/// @arg x,y,string,color1,color2
function draw_text_shadow(argument0, argument1, argument2, argument3, argument4) {

	draw_update_color(argument4);
	draw_text(argument0, argument1, argument2);

	draw_update_color(argument3);
	draw_text(argument0, argument1, argument2);


}
