///
function init_enums_entityFlags() {

	enum Entity_Flag
	{
		solid,			//	Entity cannot be walked through
		noTile44,		//	Not affected by tile 44
		invulnerable,	//	Clink sound when hit
		ignoreSolid,	//	Can go through solid tiles

		bouncy,			//	Repels player from top
		shootable,		//	Can be hit by weapons
		specialSolid,	//	
		frontHitOnly,	//	Can only be hit from the front of sprite
	
		option1,		//	
		deathEvent,		//	
		unknown1,		//	
		flagVisible,	//	
	
		option2,		//	
		interactable,	//	Press down to run entity event
		flagInvisible,	//	
		showDamage,		//	
	//	========================================================
		facingRight,	//	
		facingUp,		//	
		facingDown,		//		
		knockedOut,		//	
	
		drawWeapon,		//	
		trackPlayer,	// Always faces towards the player
		damageTaken,
		skipGrav,		// Skips adding gravity to y_speed
	
		animates,		// Uses Animation Scripts
		hide,			// Skips entity Drawing
		noDeactivate,	// Never Deactivates
		noDamagePlayer, // 
	
		inCamera,		// Entity is in Camera
		inAir,			// Entity is off ground
		justLanding,	// Entity JUST touched ground
		debug,
	}

	/*
	0x0001 - Solid
	0x0002 - No effect about Tile 44
	0x0004 - Invulnerable (Blink Sound)
	0x0008 - Ignore solid

	0x0010 - Bouncing at top
	0x0020 - Shootable
	0x0040 - Special Solid
	0x0080 - Rear and top attack power 0

	0x0100 - Costum
	0x0200 - Boss Flag
	0x0400 - ???
	0x0800 - Is visible if FlagID is set

	0x1000 - Costum
	0x2000 - Call on Event
	0x4000 - Is invisible if FlagID is set
	0x8000 - Show Damage Numbers

/* end init_enums_entityFlags */
}
