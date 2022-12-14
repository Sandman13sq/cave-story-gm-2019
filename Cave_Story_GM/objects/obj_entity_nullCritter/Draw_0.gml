/// @desc 

// Inherit the parent event
event_inherited();

if DEBUG
{
	draw_set_halign(1);
	draw_set_valign(2);

	draw_text(x + center_x, y + y_up, entityType);
}