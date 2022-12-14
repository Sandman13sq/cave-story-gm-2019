/// @desc 

draw_reset();

draw_set_halign(1);
draw_set_valign(1);

var _in = 32;

draw_box(_in, _in, 
	CAMERA_W - _in,
	CAMERA_H - _in,
	4,
	beta? Col.betaTextBox: Col.caveTextBox,
	beta? Col.betaTextRim: Col.caveTextRim
	);

Dtext_general(x, y, disclaimerText, 28, 520, 0.8, 0.8);