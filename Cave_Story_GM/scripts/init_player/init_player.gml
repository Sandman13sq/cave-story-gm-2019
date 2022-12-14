/// @desc Initialize player variables
function init_player() {

	playerData = ds_map_create();
	// destroy_playerData()

	var _dict = playerData,
	_health = 16; // Starts at 3

	_dict[? Player_Stat.items] = list_create();
	_dict[? Player_Stat.life] = _health;
	_dict[? Player_Stat.lifeMax] = _health;
	_dict[? Player_Stat.weapons] = list_create();

	_dict[? Player_Stat.current_weapon] = 0;
	_dict[? Player_Stat.dir] = Dir.left;

#macro PLAYER_DATA (Mas.game).playerData

	addPlayerWeapon(Weapon.polarStar);
	addPlayerWeapon(Weapon.fireball);
	addPlayerWeapon(Weapon.machineGun);
	addPlayerWeapon(Weapon.snake);
	addPlayerWeapon(Weapon.missileLauncher);
	addPlayerWeapon(Weapon.superLauncher);
	addPlayerWeapon(Weapon.spur);

	addPlayerWeapon(Weapon.shark);
	addPlayerWeapon(Weapon.tempest);
	addPlayerWeapon(Weapon.edge);
	addPlayerWeapon(Weapon.grenadeLauncher);

	setWeaponAmmo(Weapon.missileLauncher, 20);
	setWeaponAmmo(Weapon.superLauncher, 16);
	setWeaponAmmo(Weapon.shark, 16);
	setWeaponAmmo(Weapon.grenadeLauncher, 32);
	setWeaponAmmo(Weapon.machineGun, 100);
	setWeaponAmmo(Weapon.snake, 48);

	addPlayerItem(Item.mapSystem);
	setEquipFlag(Equip_Flag.radar);

#region Player_Stat

	enum Player_Stat
	{
		items,
		weapons,
	
		life,
		lifeMax,
	
		current_weapon,
		dir,
	
		eventFlag,
	}

#endregion

#region Item

	enum Item
	{
		null = 0,
		arthurKey,
		mapSystem,
		santaKey,
		silverLocket,
		beastFang,
		lifeCapsule,
		idCard,
		jellyJuice,
		rustyKey,
		gumKey,
		gumBase,
		charcoal,
		bomb,
		puppy,
		lifePot,
		cureAll,
		clinicKey,
		booster0_8, 
		armsBarrier,
		turboCharge,
		airTank,
		nikumaru,
		booster2_0,
		mimigaMask,
		teleporterKey,
		sueLetter,
		controller,
		brokenSprinkler,
		sprinkler,
		towRope,
		clayMedal,
		littleMan,
		mushroomBadge,
		maPignon,
		curlyPanties,
		alienMedal,
		chakoLipstick, chacoLipstick = Item.chakoLipstick,
		whimsicalStar,
		ironBond
	}

#endregion


}
