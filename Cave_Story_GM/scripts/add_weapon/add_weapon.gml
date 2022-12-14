/// @desc Adds weapon to inventory
/// @arg weapon_index,ammo,maxAmmo,experience,level,flags
function add_weapon() {

	//var _weaponData = argument[0];

	ds_list_add(weaponList, argument[0]);

	/*
	_weaponData[Weapon_Data.index] = argument[0];

	_weaponData[Weapon_Data.ammo] = argument[1];
	_weaponData[Weapon_Data.ammoMax] = argument[2];

	_weaponData[Weapon_Data.experience] = argument[3];
	_weaponData[Weapon_Data.level] = argument[4];

	_weaponData[Weapon_Data.flags] = argument[5];

	//*/

	/*

	// Ammo (Pos 0, 16 bits)
	_weaponData = _weaponData | argument[1] << Weapon_Data.btP_ammo;

	// Max Ammo (Pos 16, 16 bits) (Max of 0 Means Infinite Ammo)
	_weaponData = _weaponData | argument[2] << Weapon_Data.btP_ammoMax;

	// Experience (Pos 32, 16 bits)
	_weaponData = _weaponData | argument[3] << Weapon_Data.btP_exp;

	// Level (Pos 48, 4 bits)
	_weaponData = _weaponData | argument[4] << Weapon_Data.btP_level;

	// Flags (Pos 52, 4 bits)
	_weaponData = _weaponData | argument[5] << Weapon_Data.btP_flags;

	// Index (Pos 56, 8 bits)
	_weaponData = _weaponData | argument[0] << Weapon_Data.btP_index;

	//*/

	//ds_list_add(weaponList, _weaponData);


}
