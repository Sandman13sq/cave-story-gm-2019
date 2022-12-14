/// @desc 

// updateAnimation

if !animationFreeze
{
	// Decrease timer
	if animationStep > 1 {animationStep--}

	// Move to next Frame
	else if animationStep != -1
	{
		// Count up
		if animationKeyframe < animationSize - 1
		{
			animationKeyframe++;
		}
		// Set to loop point
		else
		{
			animationKeyframe = animationLoopPoint;
		}
			
		updateAnimationFrame();
	}
}
else
{
	animationKeyframe = frameSelect;
	updateAnimationFrame();
}