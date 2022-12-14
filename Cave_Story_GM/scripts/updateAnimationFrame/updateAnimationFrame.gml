/// @desc Updates Sprite
function updateAnimationFrame() {

	// Random Repeat
	var _data = animationData[animationKeyframe];

	if is_array(_data)
	{
		if array_length(_data) < 2 {msg(_data)};
	
		if !getBit(animationFlag, Animation_Flag.keepSprite)
		{
			sprite_index = _data[0] > 0? _data[0]: sprite_index;
		}
	
		image_index = _data[1];
		animationStep = _data[2];
	
		animationFlag = setBit(animationFlag, Animation_Flag.newFrame);

		// Offsets
		animationXOffset = _data[3];
		animationYOffset = _data[4];
	}

	// Hold frame if duration is 0
	if animationStep == 0 
	{
		animationStep = -1;
	}


}
