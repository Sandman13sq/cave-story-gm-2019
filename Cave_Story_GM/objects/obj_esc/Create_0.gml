/// @desc 
x = CAMERA_W / 2;
y = CAMERA_H / 2;

depth = -10000;

instList = list_create();

FREEZE = true;

restartGame = false;

var _inst;

for (var i = 0; i < instance_count; i++)
{
	_inst = instance_find(all, 0);
	
	if _inst != id
	{
		ds_list_add(instList, _inst);
		instance_deactivate_object(_inst);
	}
}