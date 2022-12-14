/// @desc 

var _l = ds_list_size(consoleTimer);

for (var i = 0; i < _l; i++)
{
	if consoleTimer[| i] > 0 {consoleTimer[| i]--;}
	else
	{
		ds_list_delete(consoleString, i);
		ds_list_delete(consoleTimer, i);
		ds_list_delete(consoleColor, i);
		i--;
		_l--;
	}
}
