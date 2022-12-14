/// @desc Sets stage tileType array
/// @arg index,array
function stageLayer_set_tileType(argument0, argument1) {

	with STAGE
	{
		array_direct(stageLayer[argument0], Stage_Map.type, argument1);
	}


}
