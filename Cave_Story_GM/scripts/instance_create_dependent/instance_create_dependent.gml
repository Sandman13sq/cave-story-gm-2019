/// @desc Creates instance with source variable
/// @arg source,object
function instance_create_dependent(argument0, argument1) {

	var _inst = instance_create_depth(x, y, 0, argument1);

	with _inst {source = argument0}

	return _inst;


}
