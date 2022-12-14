/// @desc 

draw_shape_rect(0, 128, 128, 320, c_caveBlack, 0.5);

draw_reset();
draw_update_font(FONT_MAIN);

draw_text_transformed(0, 128, 
	"Tab +... \n" +
	"E - Exit Event \n" +
	"R - Restart Game \n" +
	"P - Take Screenshot \n" +
	"W - See Event Script \n" +
	"D - Toggle Debug Info \n" +
	"3 - Toggle Debug Overlay \n" +
	"L - Toggle Console Info \n",
	0.5, 0.5, 0
	);