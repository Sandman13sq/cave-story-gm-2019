/// @desc Moves animation to point in animation
/// @arg position
function setAnimationPosition(argument0) {

	var _pos = argument0, _exit = false;

	// If data is present
	if animationData != undefined
	{
		while !(_exit)
		{
			if animationStep < _pos
			{
				_pos -= animationStep;
			
				animationKeyframe = (animationKeyframe + 1) mod animationSize;
				updateAnimationFrame();
			}
			else
			{
				_exit = true;
			}
		
			if _pos <= 0 {_exit = true;}
			if animationStep <= -1 {_exit = true;}
		}
	}


}
