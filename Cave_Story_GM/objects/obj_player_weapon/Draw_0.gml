/// @desc 

if instance_exists(SOURCE)
{
	if animationData != undefined
	{
		var _back = polarize(!getBit(SOURCE.playerFlag, Player_Flag.lookingBack));
		
		image_xflip = SOURCE.image_xflip * _back;
	
		draw_sprite_ext(
			sprite_index, image_index, 
			weapon_drawX + animationXOffset * image_xflip, 
			weapon_drawY + animationYOffset,
			image_xscale * animationXFlip * image_xflip, 
			image_yscale, drawDirection, 
			animationColor, image_alpha
			);
	}
	
	// draw_weapon()
}
