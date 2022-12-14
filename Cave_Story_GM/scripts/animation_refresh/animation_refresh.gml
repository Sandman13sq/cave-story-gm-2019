/// @desc Clears all loaded animation sequences
function animation_refresh() {

	var _l = ds_list_size(animationList);

	// Delete all loaded animations
	for (var i = 0; i < _l; i++)
	{
		ds_map_destroy(animationList[| i]);
	}


}
