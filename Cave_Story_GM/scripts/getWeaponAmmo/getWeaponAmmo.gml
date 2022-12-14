/// @desc Returns value of player weapon ammo
/// @arg weapon_index
function getWeaponAmmo(argument0) {

	var _weapon = argument0, _data = getWeaponData(0, _weapon);

	return _data[? Wep_Meta.ammo];


}
