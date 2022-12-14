/// @desc Returns particle index
/// @arg index
function getPartType(argument0) {

	if !ds_map_exists(PART_TYPE, argument0)
	{
		addPartType(argument0);
	}

	return PART_TYPE[? argument0];


}
