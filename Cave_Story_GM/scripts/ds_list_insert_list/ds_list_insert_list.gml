/// @desc Add list and mark as list
/// @arg id,pos,list
function ds_list_insert_list(argument0, argument1, argument2) {

	ds_list_insert(argument0, argument1, argument2);
	ds_list_mark_as_list(argument0, argument1);

	return argument1;


}
