/// @desc Initializes weapons for player
function initWeapon() {

#region Wep_Meta

	enum Wep_Meta
	{
		index,
	
		level,
		levelMax,
	
		ammo,
		ammoMax,
	
		data,
	}

#endregion

#region Wep_Data

	enum Wep_Data
	{
		object,
	
		energy,
		energyMax,
	
		index,
	}

#endregion

	var _map = ds_map_create(), _wep;

#region None

	_wep = Weapon.none;

	_map[? _wep] = initWeapon_add(_wep, 0,
		);
	
#endregion

#region Snake

	_wep = Weapon.snake;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_snake_lv1, 30),
		initWeapon_data(obj_weapon_snake_lv2, 40),
		initWeapon_data(obj_weapon_snake_lv3, 16),
		);
	
#endregion

#region Polar Star

	_wep = Weapon.polarStar;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_pStar_lv1, 10),
		initWeapon_data(obj_weapon_pStar_lv2, 20),
		initWeapon_data(obj_weapon_pStar_lv3, 10),
		);
	
#endregion

#region Missile Launcher

	_wep = Weapon.missileLauncher;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_missileL_lv1, 20),
		initWeapon_data(obj_weapon_missileL_lv2, 30),
		initWeapon_data(obj_weapon_missileL_lv3, 20),
		);
	
#endregion

#region Super Launcher

	_wep = Weapon.superLauncher;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_sMissileL_lv1, 30),
		initWeapon_data(obj_weapon_sMissileL_lv2, 60),
		initWeapon_data(obj_weapon_sMissileL_lv3, 10),
		);
	
#endregion

#region Machine Gun

	_wep = Weapon.machineGun;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_machineGun_lv1, 20),
		initWeapon_data(obj_weapon_machineGun_lv2, 30),
		initWeapon_data(obj_weapon_machineGun_lv3, 20),
		);
	
#endregion

#region Grenade Launcher

	_wep = Weapon.grenadeLauncher;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_grenadeL_lv1, 24),
		initWeapon_data(obj_weapon_grenadeL_lv2, 48),
		initWeapon_data(obj_weapon_grenadeL_lv3, 10),
		);
	
#endregion

#region Shark

	_wep = Weapon.shark;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_shark_lv1, 20),
		initWeapon_data(obj_weapon_shark_lv2, 30),
		initWeapon_data(obj_weapon_shark_lv3, 20),
		);
	
#endregion

#region Fireball

	_wep = Weapon.fireball;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_fireball_lv1, 10),
		initWeapon_data(obj_weapon_fireball_lv2, 20),
		initWeapon_data(obj_weapon_fireball_lv3, 20),
		);
	
#endregion

#region Spur

	_wep = Weapon.spur;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_spur, 0),
		);
	
#endregion

#region Tempest

	_wep = Weapon.tempest;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_tempest_lv1, 20),
		initWeapon_data(obj_weapon_tempest_lv2, 30),
		initWeapon_data(obj_weapon_tempest_lv3, 20),
		);
	
#endregion

#region Missile Launcher

	_wep = Weapon.edge;

	_map[? _wep] = initWeapon_add(_wep, 0,
		initWeapon_data(obj_weapon_edge_lv1, 10),
		);
	
#endregion

	return _map;


}
