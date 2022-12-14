/// @desc Clears weapon data
/// @arg map
function clearWeaponData(argument0) {

	var _map = argument0, _metaKey, 
	_meta, _data, _l;

	_metaKey = ds_map_find_first(_map);

	while ( ds_map_exists(_map, _metaKey) )
	{
		_meta = _map[? _metaKey];
	
		_data = _meta[? Wep_Meta.data];
	
		_l = ds_list_size(_data);
	
		for (var i = 0; i < _l; i++)
		{
			ds_map_destroy(_data[| i]);
		}
	
		list_free(_data);
	
		_metaKey = ds_map_find_next(_map, _metaKey);
	}

	ds_map_destroy(_map);


}
