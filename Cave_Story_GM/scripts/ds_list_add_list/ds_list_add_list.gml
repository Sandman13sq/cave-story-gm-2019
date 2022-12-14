/// @desc Add list and mark as list
/// @arg id,list
function ds_list_add_list(argument0, argument1) {

	ds_list_add(argument0, argument1);
	ds_list_mark_as_list(argument0, ds_list_size(argument0) - 1);

	return ds_list_size(argument0) - 1;


}
