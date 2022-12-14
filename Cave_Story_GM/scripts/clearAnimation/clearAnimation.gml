/// @desc Clears all current animations from memory
function clearAnimation() {

	var _group, _l = ds_list_size(ANIMATION_LIST);

	for (var i = 0; i < _l; i++)
	{
		ds_map_destroy(ANIMATION_LIST[| i]);
	}

	ds_list_clear(ANIMATION_LIST);
	ds_map_clear(ANIMATION_GROUP);


}
