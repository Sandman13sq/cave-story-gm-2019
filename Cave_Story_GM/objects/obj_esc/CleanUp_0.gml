/// @desc 
var _l = ds_list_size(instList);

for (var i = 0; i < _l; i++)
{
	instance_activate_object(instList[| i]);
}

list_free(instList);

FREEZE = false;