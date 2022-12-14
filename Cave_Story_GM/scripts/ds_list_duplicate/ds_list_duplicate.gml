/// @desc Returns list with same contents as source
/// @arg sourceList
function ds_list_duplicate(argument0) {

	var _list = list_create();

	ds_list_copy(_list, argument0);

	return _list;


}
