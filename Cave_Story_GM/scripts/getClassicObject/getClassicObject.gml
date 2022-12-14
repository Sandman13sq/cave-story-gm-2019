/// @desc Returns classic object by index
/// @arg typeIndex
function getClassicObject(argument0) {

	var _obj;

	switch(argument0) // Type
	{
		default: 
			_obj = -1; break;
		
		case(Entity_Type.nothing): _obj = obj_entity_static; break;
		case(Entity_Type.weaponEnergy): _obj = obj_energy; break;
	
		case(Entity_Type.behemoth): _obj = obj_entity_behemoth; break;
		case(Entity_Type.critterGreen): _obj = obj_entity_critterGreen; break;
		case(Entity_Type.beetle): _obj = obj_entity_beetle; break;
		case(Entity_Type.basil): _obj = obj_entity_basil; break;
		case(Entity_Type.beetleFollow): _obj = obj_entity_beetleFollow; break;
	
		case(Entity_Type.balrogDrop): _obj = obj_entity_balrogDrop; break;
		case(Entity_Type.balrog): _obj = obj_entity_balrog; break;
	
		case(Entity_Type.forcefield): _obj = obj_entity_forcefield; break;
		case(Entity_Type.santaKey): _obj = obj_entity_santaKey; break;
		case(Entity_Type.chestClosed): _obj = obj_entity_chestClosed; break;
		case(Entity_Type.savePoint): _obj = obj_entity_saveDisc; break;
		case(Entity_Type.refill): _obj = obj_entity_refill; break;
		case(Entity_Type.door): _obj = obj_entity_door; break;
		case(Entity_Type.balrogBust): _obj = obj_entity_balrogBust; break;
	
		// 20 -------------------------------------------------------------------------
	
		case(Entity_Type.computer): _obj = obj_entity_computer; break;
		case(Entity_Type.chestOpen): _obj = obj_entity_chestOpen; break;
		case(Entity_Type.teleporter): _obj = obj_entity_teleporter; break;
		case(Entity_Type.teleporterLight): _obj = obj_entity_teleporterLight; break;
		case(Entity_Type.liftPlatform): _obj = obj_entity_liftPlatform; break;
	
		case(Entity_Type.deathTrap): _obj = obj_entity_deathTrap; break;
	
		case(Entity_Type.cthulhu): _obj = obj_entity_cthulhu; break;
		case(Entity_Type.tetsuzou): _obj = obj_entity_tetsuzou; break;
	
		case(Entity_Type.lifeCapsule): _obj = obj_entity_lifeCapsule; break;
		case(Entity_Type.bed): _obj = obj_entity_bed; break;
		case(Entity_Type.signpost): _obj = obj_entity_signpost; break;
		case(Entity_Type.fireplaceFire): _obj = obj_entity_fireplaceFire; break;
		case(Entity_Type.saveSign): _obj = obj_entity_saveSign; break;
	
		// 40 -------------------------------------------------------------------------
	
		case(Entity_Type.santa): _obj = obj_entity_santa; break;
		case(Entity_Type.bustedDoorway): _obj = obj_entity_bustedDoorway; break;
		case(Entity_Type.sue): _obj = obj_entity_sue; break;
	
		case(Entity_Type.blackboard): _obj = obj_entity_blackboard; break;
		case(Entity_Type.blueRobotSitting): _obj = obj_entity_blueRobot_sitting; break;
	
		case(Entity_Type.axisTrigger): _obj = obj_entity_axisTrigger; break;
	
		case(Entity_Type.basu1): _obj = obj_entity_basu; break;
		case(Entity_Type.enemyDoor): _obj = obj_entity_enemyDoor; break;
	
		// 60 -------------------------------------------------------------------------
	
		case(Entity_Type.toroko): _obj = obj_entity_toroko; break;
		case(Entity_Type.king): _obj = obj_entity_king; break;
		case(Entity_Type.kazumaComputer): _obj = obj_entity; break;
		case(Entity_Type.torokoAttack): _obj = obj_entity_torokoAttack; break;
	
		case(Entity_Type.batBlue): _obj = obj_entity_bat; break;
		case(Entity_Type.critterBlue): _obj = obj_entity_critter; break;
	
		case(Entity_Type.torokoBubble): _obj = obj_entity_torokoBubble; break;
		case(Entity_Type.miseryFloat): _obj = obj_entity_miseryFloat; break;
		case(Entity_Type.bossBalrog_1): _obj = obj_boss_balrog_1; break;
		case(Entity_Type.pignon): _obj = obj_entity_pignonSmall; break;
	
		case(Entity_Type.sparkling): _obj = obj_entity_sparkling; break;
		case(Entity_Type.chinfish): _obj = obj_entity_chinfish; break;
		case(Entity_Type.sprinkler): _obj = obj_entity_sprinkler; break;
	
		case(Entity_Type.jack): _obj = obj_entity_jack; break;
		case(Entity_Type.kanpachiFishing): _obj = obj_entity_kanpachiFishing; break;
		case(Entity_Type.yamashitaFlower): _obj = obj_entity_yamashitaFlower; break;
	
		case(Entity_Type.pot): _obj = obj_entity_pot; break;
		case(Entity_Type.mahin): _obj = obj_entity_mahin; break;
	
		// 80 -------------------------------------------------------------------------
	
		case(Entity_Type.pignonBig): _obj = obj_entity_pignonBig; break;
		case(Entity_Type.miseryStand): _obj = obj_entity_miseryStand; break;
		case(Entity_Type.igorCutscene): _obj = obj_entity_igorCutscene; break;
	
		case(Entity_Type.terminal): _obj = obj_entity_terminal; break;
		case(Entity_Type.missile): _obj = obj_entity_missile; break;
		case(Entity_Type.heart): _obj = obj_entity_heart; break;
		case(Entity_Type.bossIgor): _obj = obj_boss_igor; break;
		case(Entity_Type.igorDeath): _obj = obj_entity_igorDeath; break;
	
		case(Entity_Type.cage): _obj = obj_entity_cage; break;
	
		case(Entity_Type.chako): _obj = obj_entity_chako; break;
	
		case(Entity_Type.fanLeft): _obj = obj_entity_fanLeft; break;
		case(Entity_Type.fanUp): _obj = obj_entity_fanUp; break;
		case(Entity_Type.fanRight): _obj = obj_entity_fanRight; break;
		case(Entity_Type.fanDown): _obj = obj_entity_fanDown; break;
	
		// 100 -------------------------------------------------------------------------
	
		case(Entity_Type.quoteTeleportOut): _obj = obj_entity_quoteTeleportOut; break;
		case(Entity_Type.quoteTeleportIn): _obj = obj_entity_quoteTeleportIn; break;
	
		case(Entity_Type.redPetals): _obj = obj_entity_redPetals; break;
		case(Entity_Type.curly): _obj = obj_entity_curly; break;
		case(Entity_Type.tableChair): _obj = obj_entity_tableChair; break;
	
		// 120 -------------------------------------------------------------------------
	
		case(Entity_Type.colon1): _obj = obj_entity_colon1; break;
		case(Entity_Type.colon2): _obj = obj_entity_colon2; break;
		case(Entity_Type.colonEnemy): _obj = obj_entity_colonEnemy; break;
	
		case(Entity_Type.hiddenDrop): _obj = obj_entity_hiddenDrop; break;
	
		case(Entity_Type.largeDoor_open): _obj = obj_entity_largeDoor_open; break;
		case(Entity_Type.largeDoor_closed): _obj = obj_entity_largeDoor_closed; break;
	
		// 140 -------------------------------------------------------------------------
	
		case(Entity_Type.quote): _obj = obj_entity_quote; break;
		case(Entity_Type.blueRobot): _obj = obj_entity_blueRobot; break;
		case(Entity_Type.shutterStuck): _obj = obj_entity_shutterStuck; break;
	
		// 160 -------------------------------------------------------------------------
	
		// 180 -------------------------------------------------------------------------
	
		case(Entity_Type.shutterSmall): _obj = obj_entity_shutterSmall; break;
		case(Entity_Type.shutterLarge): _obj = obj_entity_shutterLarge; break;
		case(Entity_Type.liftBlock): _obj = obj_entity_liftBlock; break;
		case(Entity_Type.waterLevel): _obj = obj_entity_waterLevel; break;
		case(Entity_Type.blueRobotPieces): _obj = obj_entity_blueRobot_pieces; break;
	
		// 200 -------------------------------------------------------------------------
	
		case(Entity_Type.spikes): _obj = obj_entity_spikes; break;
	
		case(Entity_Type.kanpachi): _obj = obj_entity_kanpachi; break;
	
		case(Entity_Type.pickedFlowers): _obj = obj_entity_houseFlower; break;
	
		case(Entity_Type.energyCapsule): _obj = obj_entity_energyCapsule; break;
	
		case(Entity_Type.playerTracker): _obj = obj_entity_playerTracker; break;
	
		case(Entity_Type.waterDroplet): _obj = obj_entity_waterDrop; break;
	}

	return _obj;

	enum Entity_Type
	{
		nothing = 0,
		weaponEnergy = 1,
	
		behemoth = 2,
	
		critterGreen = 5,
		beetle = 6,
		basil = 7,
		beetleFollow = 8,
	
		balrogDrop = 9,
	
		balrog = 12,
	
		forcefield = 13,
		santaKey = 14,
		chestClosed = 15,
		savePoint = 16,
		refill = 17,
		door = 18,
		balrogBust = 19,
		computer = 20,
		chestOpen = 21,
		teleporter = 22,
		teleporterLight = 23,
		liftPlatform = 25,
	
		deathTrap = 27,
		cthulhu = 29,
		tetsuzou = 30,
		lifeCapsule = 32,
		bed = 34,
		signpost = 37,
		fireplaceFire = 38,
		saveSign = 39,
		santa = 40,
		bustedDoorway = 41,
		sue = 42,
	
		blackboard = 43,
	
		axisTrigger = 46, // Hori/Vert Trigger
	
		blueRobotSitting = 52,
	
		basu1 = 58,
		enemyDoor = 59,
	
		toroko = 60, // tokoro = Entity_Type.toroko,
		king = 61,
		kazumaComputer = 62,
		torokoAttack = 63,
	
		critterBlue = 64,
		batBlue = 65,
		torokoBubble = 66,
		miseryFloat = 67,
		bossBalrog_1 = 68,
		pignon = 69,
	
		sparkling = 70,
		chinfish = 71,
		sprinkler = 72,
	
		jack = 74,
		kanpachiFishing = 75,
		yamashitaFlower = 76,
	
		pot = 78,
		mahin = 79,
	
		pignonBig = 81,
		miseryStand = 82,
		igorCutscene = 83,
	
		terminal = 85,
		missile = 86,
		heart = 87,
		bossIgor = 88,
		igorDeath = 89,
	
		cage = 91,
	
		chako = 93, chaco = Entity_Type.chako,
	
		fanLeft = 96,
		fanUp = 97,
		fanRight = 98,
		fanDown = 99,
	
		quoteTeleportOut = 111,
		quoteTeleportIn = 112,
	
		redPetals = 116,
		curly = 117,
		tableChair = 119,
		colon1 = 120,
		colon2 = 121,
		colonEnemy = 122,
	
		hiddenDrop = 125,
	
		largeDoor_open = 137,
		largeDoor_closed = 138,
	
		quote = 150,
		blueRobot = 151,
		shutterStuck = 152,
	
		shutterLarge = 184,
		shutterSmall = 185,
		liftBlock = 186,
		waterLevel = 191,
		blueRobotPieces = 194,
	
		spikes = 211,
	
		kanpachi = 226,
	
		pickedFlowers = 234,
	
		energyCapsule = 253,
	
		playerTracker = 302,
	
		waterDroplet = 359,
	}


}
