/// @desc Returns array of entities that have a matching event
/// @arg event
function find_entity() {

	var _arr = array_create(0), 
	_entity = -1, _index = 0, _l = instance_number(obj_entity);

	for (var i = 0; i < _l; i++)
	{
		_entity = instance_find(ENTITY, i);
	
		if _entity.event == argument[0]
		{
			_arr[_index] = _entity;
			_index++;
		}
	}

	return _arr;


}
