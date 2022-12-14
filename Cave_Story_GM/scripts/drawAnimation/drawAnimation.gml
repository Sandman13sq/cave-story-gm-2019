/// @desc Draws sprite
/// @arg x,y
function drawAnimation(argument0, argument1) {

	if animationData != undefined
	{
		var _palettes = getBit(animationFlag, Animation_Flag.palettesEnabled);
	
		// Set Palette
		if _palettes
		{
			pal_swap_set(animationPalSprite, animationPalIndex, false);
		}
		// Set Shader
		else if animationShader != shd_default
		{
			shader_set(animationShader);
		}
	
		draw_sprite_ext(
			sprite_index, image_index, 
			(argument0 + animationXOffset), 
			(argument1 + animationYOffset),
			image_xscale * animationXFlip * (image_xflip? 1: -1), 
			image_yscale, 0, 
			animationColor, image_alpha
			);

		if _palettes
		{
			pal_swap_reset();
		} 
		else if shader_current() != shd_default
		{
			shader_set(shd_default);
		}
	
		pal_swap_reset()
	}


}
