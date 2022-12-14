/// @desc Returns list and adds to number of lists
function list_create() {

	var _list = ds_list_create();

	// ds_list_add(global.listTracker, _list);

	global.listCount++;

	return _list;


}
