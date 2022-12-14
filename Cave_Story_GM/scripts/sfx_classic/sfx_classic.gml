/// @desc Returns sound based on classic index
/// @arg index
function sfx_classic(argument0) {

#region Sound

	enum Sound
	{
		text = 2,
		bonk = 3,
		weaponSwitch = 4,
	
		critterJump = 6,
	
		door = 11,
		weaponEnergy = 14,
		playerDamage = 16,
		playerDeath = 17,
		refill = 20,
		click = 22,
		thud = 23,
	
		quake = 26,
		levelUp = 27,
		littleCrash = 28,
		teleport = 29,
		clink = 31,
		polarStar = 32,
		fireball = 33,
		fireballBounce = 34,
		missileExplosion = 35,
	
		getItem = 38,
	
		computerBeep = 43,
	
		hurtSmall = 50,
		hurtEnemy = 51,
		hurtBig = 52, //
		squeal = 53,
		hurtCool = 54,
	
		booster = 71,
		blockExplosion = 72,
	}

#endregion

	var _snd = 0;

	switch(argument0)
	{
		case(Sound.text): _snd = snd_talk_0; break;
		case(Sound.weaponSwitch): _snd = snd_switchWeapon; break;
		case(Sound.door): _snd = snd_door; break;
		case(Sound.levelUp): _snd = snd_levelUp; break;
		case(Sound.clink): _snd = snd_clink; break;
		case(Sound.thud): _snd = snd_thud; break;
	
		case(Sound.computerBeep): _snd = snd_computerBeep; break;
		case(Sound.click): _snd = snd_click; break;
		case(Sound.quake): _snd = snd_quake; break;
	
		case(Sound.polarStar): _snd = snd_polarStar_shot; break;
		case(Sound.fireball): _snd = snd_fireball; break;
		case(Sound.fireballBounce): _snd = snd_fireball; break;
		case(Sound.missileExplosion): _snd = snd_missileHit; break;
	
		case(Sound.playerDamage): _snd = snd_playerHurt; break;
		case(Sound.playerDeath): _snd = snd_playerHurt; break;
		case(Sound.getItem): _snd = snd_getItem; break;
	
		//case(Sound.squeal): _snd = snd_squeal; break;
		case(Sound.hurtSmall): _snd = snd_hurtSmall; break;
		case(Sound.hurtEnemy): _snd = snd_hurtEnemy; break;
		case(Sound.hurtBig): _snd = snd_hurtBig; break;
		case(Sound.hurtCool): _snd = snd_hurtCool; break;
		case(Sound.squeal): _snd = snd_squeal; break;
	
		case(Sound.teleport): _snd = snd_teleport; break;
	
		case(Sound.booster): _snd = snd_booster; break;
		case(Sound.refill): _snd = snd_healthGet; break;
	
		case(Sound.blockExplosion): _snd = snd_blockDestroy; break;
		case(Sound.littleCrash): _snd = snd_littleCrash; break;
	}

	return _snd;


}
