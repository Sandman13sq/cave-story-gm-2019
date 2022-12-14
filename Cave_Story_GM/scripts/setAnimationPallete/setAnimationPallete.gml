/// @desc Sets palette information
/// @arg palette_sprite,palette_index
function setAnimationPallete(argument0, argument1) {

	animationFlag = setBit(animationFlag, Animation_Flag.palettesEnabled);

	animationPalSprite = argument0 >= 0? argument0: animationPalSprite;
	animationPalIndex = argument1 >= 0? argument1: animationPalIndex;


}
