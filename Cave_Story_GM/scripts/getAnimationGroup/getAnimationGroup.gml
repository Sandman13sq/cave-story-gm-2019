/// @desc Returns array of keyframes for animation
/// @arg group,index
function getAnimationGroup(argument0) {

	if !ds_map_exists(ANIMATION_GROUP, argument0)
	{
		loadAnimationGroup(argument0);
	}

	return ANIMATION_GROUP[? argument0];


}
