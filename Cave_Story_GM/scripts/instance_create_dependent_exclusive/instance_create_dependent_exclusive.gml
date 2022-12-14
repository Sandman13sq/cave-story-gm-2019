/// @desc Creates instance with source variable with no duplicates
/// @arg source_id,object
function instance_create_dependent_exclusive(argument0, argument1) {

	var //_list = list_create(), 
	_src = argument0, _dep = argument1, 
	_inst = noone, _canCreate = true;
	//_l = instance_number(_dep),

	with _dep
	{
		if SOURCE == _src {_canCreate = false;}
	}

	if _canCreate
	{
		_inst = instance_create_depth(x, y, 0, _dep);
		with _inst {SOURCE = _src}
	}

	return _inst;


}
