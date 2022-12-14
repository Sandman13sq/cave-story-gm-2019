/// @desc Restart Game

var _l = ds_list_size(instList);

for (var i = 0; i < _l; i++)
{
	instance_activate_object(instList[| i]);
}

FREEZE = false;

restartGame = 1;