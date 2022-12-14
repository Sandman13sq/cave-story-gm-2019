/// @desc 
/// @arg groupIndex
function animmaker_createSequence(argument0) {

	var _seq = list_create(),
	_groupIndex = argument0, 
	_nameList = seqName[| _groupIndex],
	_name = "seq_" + string(addedSequences);

	// Add Sequence to Group
	ds_list_add(group[| _groupIndex], _seq);

	// Add Name to Sequence Name List
	ds_list_add(_nameList, _name);

	animmaker_createFrame(_seq);

	addedSequences++;

	return _seq;


}
