/// @desc 
draw_reset();

draw_update_color(c_white);
draw_update_font(global.DreamFont);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

Dtext_scale(x, y, "+" + string(experience), 1, wipeHeight);