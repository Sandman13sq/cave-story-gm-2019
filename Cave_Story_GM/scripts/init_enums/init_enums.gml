/// Initializes enumerators for the game
function init_enums() {

#region enum Mas

	enum Mas
	{
		game = mas_game,
		camera = mas_camera,
		background = mas_background,
		event = mas_event,
		debug = mas_debug,
		music = mas_music,
		controller = mas_controller,
		animation = mas_animation,
		stage = mas_stage,
		console = mas_console,
		structure = mas_struct,
	}

#endregion

#region enum Char

	enum Char
	{
		action = 128,
		back,
		menu,
		alt,
		right,
		up,
		left,
		down,
		on,
		off,
		check_empty,
		check_on,
		check_off,
	}

#endregion

#region enum Animation

	enum Animation
	{
		null = -128,
	
		idle,
			idleR,
			idleUR,
			idleU,
			idleUL,
			idleL,
			idleDL,
			idleD,
			idleDR,
		
		walk,
			walkR,
			walkUR,
			walkU,
			walkUL,
			walkL,
			walkDL,
			walkD,
			walkDR,
		
		battle,
			battle_move,
			battle_return,
			battle_idle,
			battle_getup,
			battle_sliding,
			battle_knockback,
				battle_knockback_peak,
				battle_knockback_rise,
				battle_knockback_fall,
			battle_hurt,
		
		celebrate,
		down,
		
		temp = -1,
	
		flag_xflip = 0,
		flag_randomRepeat, // Restarts animation from beginning sometimes (Use for idle animations)
	}

#endregion

#region enum LyrDepth

	enum LyrDepth
	{
		collision = 90,
		backEntities = 10,
		midEntities = 5,
		player = 0,
		frontEntities = -5,
		foreground = -10,
			forewater = -9000,
		background = 1000,
			backwater = 9000,
		maxFront = -10000,
		maxBack = 10000,
	}

#endregion

#region enum Col + Macros

	enum Col
	{
		snes = $262626,
		dead = $636D7C,
	
		onyxBlack = $020000,
		onyxBlue = $7F0021,
		onyxPink = $9B00C1,
	
		active = c_lime,
		inactive = c_fuchsia,
		target = $721FFF,
		down = $4434FF,
	
		keyItem = $B0D0FF,
	
		bulletMid = $CF7264,
		bulletDark = $94413B,
	
		expLight = $00B5FF,
		expDark = $004284,
	
		hp = $3E19EA,
		missileBlue = 0xFF4A29,
		water = 0x733E15,
	
		caveBlack = $100000,
		caveBrown = 0x000010,
		caveTextBox = $422119,
		caveTextRim = $00B5FF,
	
		betaTextBox = $5A2115,
		betaTextRim = $FFEFD6,
	
		thirdBar = 0xDEB5A0,
	}

#macro c_caveBlack Col.caveBlack
#macro c_caveBrown Col.caveBrown
#macro c_textBox Col.caveTextBox
#macro c_textRim Col.caveTextRim
#macro c_missileBlue Col.missileBlue
#macro c_hp Col.hp
#macro c_exp Col.expLight
#macro c_thirdBar Col.thirdBar

#endregion

#region enum Dir

	enum Dir
	{
		left = 0,
		up = 1,
		right = 2,
		down = 3,
		center = 4,
		keep = 5,
	}

#endregion

#region enum Dif

	enum Dif // Difficulty
	{
		easy = 0,
		norm = 1,
		hard = 2,
		arma = 3,
	
		mefe = 0,
		love = 1,
	
		colMid = 0,
		colLight = 1,
		colDark = 2,
	}

#endregion

#region enum FullMask

	enum FullMask // Bitmasks with all values set to 1
	{
		/*
		| ( Highest Value)      |   _Number of bits           |
		*/
		zero = 0,						_0  = FullMask.zero,
		one = (2) - 1,					_1  = FullMask.one,
		two = (4) - 1,					_2  = FullMask.two,
		three = (8) - 1,				_3  = FullMask.three,
		four = (16) - 1,				_4  = FullMask.four,
		five = (32) - 1,				_5  = FullMask.five,
		six = (64) - 1,					_6  = FullMask.six,
		seven = (128) - 1,				_7  = FullMask.seven,
		eight = (256) - 1,				_8  = FullMask.eight,
		nine = (512) - 1,				_9  = FullMask.nine,
		ten = (1024) - 1,				_10 = FullMask.ten,
		eleven = (2048) - 1,			_11 = FullMask.eleven,
		twelve = (4096) - 1,			_12 = FullMask.twelve,
		thirteen = (8192) - 1,			_13 = FullMask.thirteen,
		fourteen = (16384) - 1,			_14 = FullMask.fourteen,
		fifthteen = (32768) - 1,		_15 = FullMask.fifthteen,
		sixteen = (65536) - 1,			_16 = FullMask.sixteen,
		seventeen = (131072) - 1,		_17 = FullMask.seventeen,
	
		thirtytwo = (4294967296) - 1,	_32 = FullMask.thirtytwo,
	}

#endregion

#region enum Key

	enum Key
	{
		bracketLeft = 219,
		bracketRight = 221,
	
		colon = 186,
		quote = 222,
	
		lessThan = 188,
		greaterThan = 190,
	}

#endregion


}
