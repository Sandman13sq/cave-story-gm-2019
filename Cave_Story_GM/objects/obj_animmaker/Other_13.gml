/// @desc Update Preview
animationSize = frameCount;

var _frame;

for (var i = 0; i < animationSize; i++)
{
	_frame = sequenceCurrent[| i];
	animationData[i] = ds_exists(_frame, ds_type_list)? ds_list_to_array(_frame): array_create(propertyCount);
}

animationKeyframe = 0;
animationStep = 0;
animationLoopPoint = 0;

updateAnimationFrame();