/// @desc Deletes all loaded particle types
function refreshPartType() {

	var _l = ds_list_size(PART_TYPE_LIST);

	for (var i = 0; i < _l; i++)
	{
		part_type_destroy(PART_TYPE[? PART_TYPE_LIST[| i]]);
	}

	ds_list_clear(PART_TYPE_LIST);
	ds_map_clear(PART_TYPE);


}
