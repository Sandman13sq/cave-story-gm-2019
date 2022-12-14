/// @desc Adds weapon to weapon pool
/// @arg index,maxAmmo,*weapondata,*data,*...
function initWeapon_add() {

	var _map = ds_map_create();

	_map[? Wep_Meta.index] = argument[0];

	_map[? Wep_Meta.levelMax] = 0;
	_map[? Wep_Meta.level] = 0;

	_map[? Wep_Meta.ammoMax] = argument[1];
	_map[? Wep_Meta.ammo] = _map[? Wep_Meta.ammoMax];

	_map[? Wep_Meta.data] = list_create();

	for (var i = 2; i < argument_count; i++)
	{
		ds_list_add(_map[? Wep_Meta.data], argument[i]);
		_map[? Wep_Meta.level] = 1;
		_map[? Wep_Meta.levelMax]++;
	}

	return _map;


}
