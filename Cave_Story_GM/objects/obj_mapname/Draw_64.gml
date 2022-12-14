/// @desc 

draw_reset();

draw_update_alpha(alpha);

draw_update_color(Col.betaTextBox);
Dtext(x + sep, y + sep, caption);

draw_update_color(c_white);
Dtext(x - sep, y - sep, caption);