/// @desc
/// @arg sequenceList,pos
function animmaker_deleteFrame(argument0, argument1) {

	var _seq = argument0;

	// Delete only if at least one frame will be left over
	if ds_list_size(_seq) > 1
	{
		ds_list_delete(_seq, argument1);
	}


}
