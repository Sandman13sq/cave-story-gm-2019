/// @desc Draws sprite
/// @arg x,y,height_to_subtract
function drawAnimation_height(argument0, argument1, argument2) {

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
	
		// Draw Entity
		draw_sprite_part_ext(sprite_index, image_index, 0, 0,
			sprite_get_width(sprite_index), sprite_get_height(sprite_index) - argument2, 
			argument0 + animationXOffset - sprite_get_xoffset(sprite_index), 
			argument1 + animationYOffset - sprite_get_yoffset(sprite_index), 
			image_xscale * animationXFlip * (image_xflip? 1: -1), 
			image_yscale, 
			animationColor, image_alpha
			)
		
		if _palettes
		{
			pal_swap_reset();
		} 
		else if shader_current() != shd_default
		{
			shader_set(shd_default);
		}
	}


}
