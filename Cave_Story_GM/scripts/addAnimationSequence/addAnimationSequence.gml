/// @desc Adds animation to group
/// @arg group,index,frame0,frame1,...
function addAnimationSequence() {

	var _group = ANIMATION_GROUP[? argument[0]],
	_start = argument_count - 1,
	_arr;

	// Iterate through arguments backwards
	for (var i = _start; i >= 2; i--)
	{
		_arr[i - 2] = argument[i];
	}

	_group[? argument[1]] = _arr;


}
