/// @desc
function init_weapon() {

#region Enums

	enum Weapon
	{
		none = 0,
		snake,
		polarStar,
		fireball,
		machineGun,
		missileLauncher,
		missileAmmo,
		bubbler,
		green,
		blade,
		superLauncher,
		superAmmo,
		nemesis,
		spur,
		// New
		shark,
		grenadeLauncher,
		edge,
		tempest,
	
		count,
	}

	enum Weapon_Data
	{
		level = 0,
		maxLevel = 1,
		ammo = 2,
		maxAmmo = 3,
	
		experience = 2,
		maxExperience = 3,
	}

#endregion

	weaponData_list = list_create();
#macro WEAPONDATALIST GAME.weaponData_list

	for (var i = 0; i < Weapon.count; i++)
	{
		var _weapon;
	
		_weapon[0, Weapon_Data.level] = 1;	// Level
		_weapon[0, Weapon_Data.maxLevel] = 0;	// Max Level
		_weapon[0, Weapon_Data.ammo] = 0;	// Ammo
		_weapon[0, Weapon_Data.maxAmmo] = 0;	// Max Ammo
	
		for (var j = 1; j <= 3; j++)
		{
			//_weapon[j, 0] = -1;	// Ammo
			//_weapon[j, 1] = -1;	// Max Ammo
		
			_weapon[j, Weapon_Data.experience] = 0;	// Experience
			_weapon[j, Weapon_Data.maxExperience] = 16 * j;	// Max Experience
		
			_weapon[j, 4] = 0;	// Object
			_weapon[j, 5] = 0;	// Sprite
		}
	
		ds_list_add(weaponData_list, _weapon);
	}

	// Snake
	set_weapon_data(Weapon.snake, 1,
		0, 30, obj_weapon_snake_lv1, spr_wep_snake);
	set_weapon_data(Weapon.snake, 2,
		0, 40, obj_weapon_snake_lv2, spr_wep_snake);
	set_weapon_data(Weapon.snake, 3,
		0, 16, obj_weapon_snake_lv3, spr_wep_snake);
	
	// Polar Star --------------------------------------------------
	set_weapon_data(Weapon.polarStar, 1,
		0, 10, obj_weapon_pStar_lv1, spr_wep_polarStar);
	set_weapon_data(Weapon.polarStar, 2,
		0, 20, obj_weapon_pStar_lv2, spr_wep_polarStar);
	set_weapon_data(Weapon.polarStar, 3,
		0, 10, obj_weapon_pStar_lv3, spr_wep_polarStar);
	
	// Missle Launcher --------------------------------------------------
	//set_weapon_ammo(Weapon.missileLauncher, 12);
	set_weapon_data(Weapon.missileLauncher, 1,
		0, 10, obj_weapon_missileL_lv1, spr_wep_missileLauncher);
	set_weapon_data(Weapon.missileLauncher, 2,
		0, 20, obj_weapon_missileL_lv2, spr_wep_missileLauncher);
	set_weapon_data(Weapon.missileLauncher, 3,
		0, 10, obj_weapon_missileL_lv3, spr_wep_missileLauncher);
	
	// Super Missle Launcher --------------------------------------------------
	//set_weapon_ammo(Weapon.superLauncher, 24);
	set_weapon_data(Weapon.superLauncher, 1,
		0, 30, obj_weapon_sMissileL_lv1, spr_wep_superLauncher);
	set_weapon_data(Weapon.superLauncher, 2,
		0, 60, obj_weapon_sMissileL_lv2, spr_wep_superLauncher);
	set_weapon_data(Weapon.superLauncher, 3,
		0, 10, obj_weapon_sMissileL_lv3, spr_wep_superLauncher);
	
	// Machine Gun --------------------------------------------------
	set_weapon_data(Weapon.machineGun, 1,
		0, 16, obj_weapon_machineGun_lv1, spr_wep_machineGun);
	set_weapon_data(Weapon.machineGun, 2,
		0, 16, obj_weapon_machineGun_lv2, spr_wep_machineGun);
	set_weapon_data(Weapon.machineGun, 3,
		0, 16, obj_weapon_machineGun_lv3, spr_wep_machineGun);
	
	// Grenade Launcher --------------------------------------------------
	set_weapon_data(Weapon.grenadeLauncher, 1,
		0, 24, obj_weapon_grenadeL_lv1, spr_wep_grenadeLauncher);
	set_weapon_data(Weapon.grenadeLauncher, 2,
		0, 48, obj_weapon_grenadeL_lv2, spr_wep_grenadeLauncher);
	set_weapon_data(Weapon.grenadeLauncher, 3,
		0, 160, obj_weapon_grenadeL_lv3, spr_wep_grenadeLauncher);
	
	// Shark --------------------------------------------------
	//set_weapon_ammo(Weapon.shark, 24);
	set_weapon_data(Weapon.shark, 1,
		0, 16, obj_weapon_shark_lv1, spr_wep_shark);
	set_weapon_data(Weapon.shark, 2,
		0, 16, obj_weapon_shark_lv2, spr_wep_shark);
	set_weapon_data(Weapon.shark, 3,
		0, 16, obj_weapon_shark_lv3, spr_wep_shark);
	
	// Fireball --------------------------------------------------
	set_weapon_data(Weapon.fireball, 1,
		0, 10, obj_weapon_fireball_lv1, spr_wep_fireball);
	set_weapon_data(Weapon.fireball, 2,
		0, 20, obj_weapon_fireball_lv2, spr_wep_fireball);
	set_weapon_data(Weapon.fireball, 3,
		0, 20, obj_weapon_fireball_lv3, spr_wep_fireball);
	
	// Spur --------------------------------------------------
	set_weapon_data(Weapon.spur, 1,
		0, 10, obj_weapon_spur, spr_wep_spur);
	
	// Tempest --------------------------------------------------
	set_weapon_data(Weapon.tempest, 1,
		0, 20, obj_weapon_tempest_lv1, spr_wep_tempest);
	set_weapon_data(Weapon.tempest, 2,
		0, 30, obj_weapon_tempest_lv2, spr_wep_tempest);
	set_weapon_data(Weapon.tempest, 3,
		0, 20, obj_weapon_tempest_lv3, spr_wep_tempest);
	
	// Spur --------------------------------------------------
	set_weapon_data(Weapon.edge, 1,
		0, 10, obj_weapon_edge_lv1, spr_wep_edge);

	/*
		Level
		Max Level
	
		(Per Level)
			Ammo
			Max Ammo
			Experience
			Max Experience
			Weapon Object
	*/


}
