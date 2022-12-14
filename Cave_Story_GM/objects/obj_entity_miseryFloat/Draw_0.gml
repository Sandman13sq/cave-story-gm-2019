/// @desc 

if teleporting
{
	drawAnimation_height(
		x + sprite_offset_x + teleportX + width * !image_xflip, 
		y + sprite_offset_y,
		teleporting);
}
else
{
	// Inherit the parent event
	event_inherited();
}