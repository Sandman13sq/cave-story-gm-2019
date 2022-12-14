/// @desc Returns element of stage layer
/// @arg index,key
function stageLayer_get(argument0, argument1) {

	with STAGE
	{
		var _arr = stageLayer[argument0];
	
		return _arr[argument1];
	}


}
