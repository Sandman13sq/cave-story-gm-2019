/// @desc Initializes variables for animations
/// @arg group,*flag
function initAnimation() {

	image_speed = 0;

	loadAnimationGroup(argument[0]);

	flag = setBit(flag, Entity_Flag.animates);

	animationGroup = ANIMATION_GROUP[? argument[0] ];
	animationIndex = -1;
	animationIndexLast = -1;

	animationKeyframe = 0;
	animationData = undefined;
	animationSize = 0;
	animationStep = 0;
	animationSpeed = 1;

	animationFreeze = 0;
	animationXOffset = 0;
	animationYOffset = 0;

	animationXFlip = 1;
	animationColor = c_white;
	animationShader = shd_default;

	animationPalIndex = -1;
	animationPalSprite = -1;

	if !irandom(90) {animationShader = shd_doomTransparent;}

	animationFlag = argument_count > 1? argument[1]: 0;

	setAnimation(0);

	enum Animation_Flag
	{
		newFrame,
		running,
	
		palettesEnabled,
		keepSprite,
	}


}
