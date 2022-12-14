/// @desc Returns true if animation frame is at index and was just set
/// @arg frame,frame,...
function animationNewFrameIs() {

	var _ret = false;

	if getBit(animationFlag, Animation_Flag.newFrame)
	{

		for (var i = 0; i < argument_count; i++)
		{
			if animationKeyframe == argument[i]
			{_ret = true; break;}
		}

	}

	return _ret;


}
