/// @desc Sets ammo of weapon
/// @arg weapon,ammo
function setWeaponAmmo() {

	var _weapon = argument[0], _value = argument[1],
	_meta = getWeaponMeta(0, _weapon);

	_meta[? Wep_Meta.ammoMax] = max(_value, 0);
	_meta[? Wep_Meta.ammo] = max(_value, 0);


}
