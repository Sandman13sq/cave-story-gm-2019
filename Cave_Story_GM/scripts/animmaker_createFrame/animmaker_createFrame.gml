/// @desc
/// @arg sequenceList
function animmaker_createFrame(argument0) {

	var _seq = argument0,
	_frame = list_create();

	// Set Up Frame
	ds_list_add(_frame, 
		0, 
		0, 
		1, 
		0, 
		0, 
		0
		);
	
	// Add Frame to List
	ds_list_add(_seq, _frame);

	return _frame;


}
