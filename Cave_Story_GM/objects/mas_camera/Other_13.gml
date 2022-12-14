/// @desc 
	
var _l = ds_list_size(activationList);

for (var i = 0; i < _l; i++)
{
	instance_activate_object(activationList[| i]);
}

ds_list_clear(activationList);