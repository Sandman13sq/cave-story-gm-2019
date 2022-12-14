/// @desc 

if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.showGUI)
{
	draw_reset();

	draw_set_halign(1);
	draw_set_valign(1);

	Dtext(x, y, "AIR " + string(airCount));
}