/// @desc 

// Inherit the parent event
//event_inherited();

if !(flag & 1 << Entity_Flag.hide)
{
	draw_sprite_ext(sprite_index, image_index, 
		x, y,
		image_xscale, image_yscale, 0, image_blend, image_alpha
		);
}