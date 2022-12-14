/// @desc Activatte

var _deSize = ds_list_size(deactivatedList);
for (var i = 0; i < _deSize; i++)
{
	instance_activate_object(deactivatedList[| i]);
}

ds_list_clear(deactivatedList);