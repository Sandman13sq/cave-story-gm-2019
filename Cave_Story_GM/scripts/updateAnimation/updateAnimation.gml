/// @desc Updates animation
function updateAnimation() {

	if animationFreeze {animationFreeze -= animationFreeze > 0}
	else
	{
		animationFlag = clearBit(animationFlag, Animation_Flag.newFrame);
	
		// Switch Animation
		if animationIndex != animationIndexLast
		{
			animationIndexLast = animationIndex;
		
			animationData = animationGroup[? animationIndex];
		
			if animationData != undefined
			&& animationData != 0
			{
				animationSize = array_length(animationData);
				animationKeyframe = 0;
		
				updateAnimationFrame();
			}
		}
	
		// If data is present
		if animationData != undefined
		{
			// Decrease timer
			if animationStep > 1 {animationStep = max(0, animationStep - animationSpeed)}
			// Move to next Frame
			else if animationStep != -1
			{
				animationKeyframe = (animationKeyframe + 1) mod animationSize;
			
				updateAnimationFrame();
			}
		}
	}


}
