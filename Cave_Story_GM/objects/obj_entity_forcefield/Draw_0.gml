/// @desc 

// Inherit the parent event
//event_inherited();

if !getFlag(Entity_Flag.hide)
{
	draw_sprite_region_v(
		sprite_index, 0,
		x, y, y + UNIT_PX, xstart - CURRENT_FRAME * 2
		);
}