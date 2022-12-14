/// @desc Returns true if player has weapon ammo
/// @arg weapon_index
function weaponAmmoIsMax(argument0) {

	// Returns true if ammo is greater than 1
	// or if max ammo is 0 (Infinite Ammo)

	var _weapon = argument0,
	_meta = getWeaponMeta(0, _weapon);

	return (_meta[? Wep_Meta.ammo] >= _meta[? Wep_Meta.ammoMax]) || _meta[? Wep_Meta.ammoMax] <= 0;


}
