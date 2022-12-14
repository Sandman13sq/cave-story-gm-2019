/// @desc Set animation
/// @arg index,*forceAnimation?
function setAnimation() {

	// Force Animation to restart
	if argument_count > 1
	{
		animationIndexLast = argument[1]? -1: animationIndexLast;
	}

	// Change Animation
	if argument[0] != animationIndex
	{
		animationIndex = argument[0];
	}


}
