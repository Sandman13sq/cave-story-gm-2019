/// @desc Destroys list and subtracts from number of lists
/// @arg ds_list
function list_free(argument0) {

	var _list = argument0;

	if ds_exists(_list, ds_type_list)
	{
		ds_list_destroy(argument0);
	
		global.listCount--;
	
		if keyboard_check_direct(vk_numpad0)
		{
			var _tag = "";
		
			if ds_exists(global.listTag, ds_type_map)
			{
				if !is_undefined(global.listTag[? argument0])
				{
					_tag = global.listTag[? argument0];
				}
			}
		
			msg( object_get_name(object_index), global.listCount, _tag);
		}
	
		if ds_exists(global.listTag, ds_type_map)
		{
			ds_map_delete(global.listTag, argument0);
		}

		if global.listCount == 0
		{
		
			cout("All lists freed!"); 
		
			if ds_exists(global.listTag, ds_type_map)
			{
				ds_map_destroy(global.listTag);
			}
		}
	}


}
