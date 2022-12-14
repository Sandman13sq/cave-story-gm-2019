/// @desc Adds ammo to weapon
/// @arg weapon,value
function addWeaponMaxAmmo() {

	var _weapon = argument[0], _value = argument[1],
	_meta = getWeaponMeta(0, _weapon);

	_meta[? Wep_Meta.ammoMax] = max(_meta[? Wep_Meta.ammoMax] + _value, 0);
	_meta[? Wep_Meta.ammo] = max(_meta[? Wep_Meta.ammo] + _value, 0);


}
