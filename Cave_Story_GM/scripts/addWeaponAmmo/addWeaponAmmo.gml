/// @desc Adds ammo to weapon
/// @arg weapon,value
function addWeaponAmmo() {

	var _weapon = argument[0], _value = argument[1],
	_meta = getWeaponMeta(0, _weapon);

	_meta[? Wep_Meta.ammo] = clamp(_meta[? Wep_Meta.ammo] + _value, 0, _meta[? Wep_Meta.ammoMax]);

	/*

	var _list = WEAPONDATALIST, _arr = _list[| _weapon];

	_arr[0, Weapon_Data.ammo] = clamp(_arr[0, Weapon_Data.ammo] + _value, 0, _arr[0, Weapon_Data.maxAmmo]);

	_list[| _weapon] = _arr;

	if weaponList[| weaponCurrent] == _weapon
	{
		weaponData[? Wep_Meta.ammo] = _arr[0, Weapon_Data.ammo];
		weaponData[? Wep_Meta.ammoMax] = _arr[0, Weapon_Data.maxAmmo];
	}

/* end addWeaponAmmo */
}
