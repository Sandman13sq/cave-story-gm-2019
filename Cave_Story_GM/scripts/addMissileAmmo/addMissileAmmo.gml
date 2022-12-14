/// @desc Adds ammo to weapons that require missiles
/// @arg ammo
function addMissileAmmo(argument0) {

	var _ammo = argument0;

	addWeaponAmmo(Weapon.missileLauncher, _ammo);
	addWeaponAmmo(Weapon.superLauncher, _ammo);
	addWeaponAmmo(Weapon.grenadeLauncher, _ammo);
	addWeaponAmmo(Weapon.shark, _ammo);


}
