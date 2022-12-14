/// @desc Converts classic flag format to new format
/// @arg oldFlag
function convert_classicFlag() {

	var _oldFlag = argument[0], _flag = 0;

	if _oldFlag >= 0x8000 
		{_oldFlag -= 0x8000; _flag = _flag | 1 << Entity_Flag.showDamage};
	
	if _oldFlag >= 0x4000 
		{_oldFlag -= 0x4000; _flag = _flag | 1 << Entity_Flag.flagInvisible};
	
	if _oldFlag >= 0x2000 
		{_oldFlag -= 0x2000; _flag = _flag | 1 << Entity_Flag.interactable};
	
	if _oldFlag >= 0x1000 
		{_oldFlag -= 0x1000; _flag = _flag | 1 << Entity_Flag.option2};
	
	if _oldFlag >= 0x0800 
		{_oldFlag -= 0x0800; _flag = _flag | 1 << Entity_Flag.flagVisible};
	
	if _oldFlag >= 0x0400 
		{_oldFlag -= 0x0400; _flag = _flag | 1 << Entity_Flag.unknown1};
	
	if _oldFlag >= 0x0200 
		{_oldFlag -= 0x0200; _flag = _flag | 1 << Entity_Flag.deathEvent};
	
	if _oldFlag >= 0x0100 
		{_oldFlag -= 0x0100; _flag = _flag | 1 << Entity_Flag.option1};
	
	if _oldFlag >= 0x0080 
		{_oldFlag -= 0x0080; _flag = _flag | 1 << Entity_Flag.frontHitOnly};
	
	if _oldFlag >= 0x0040 
		{_oldFlag -= 0x0040; _flag = _flag | 1 << Entity_Flag.specialSolid};
	
	if _oldFlag >= 0x0020 
		{_oldFlag -= 0x0020; _flag = _flag | 1 << Entity_Flag.shootable};
	
	if _oldFlag >= 0x0010 
		{_oldFlag -= 0x0010; _flag = _flag | 1 << Entity_Flag.bouncy};
	
	if _oldFlag >= 0x0008 
		{_oldFlag -= 0x0008; _flag = _flag | 1 << Entity_Flag.ignoreSolid};
	
	if _oldFlag >= 0x0004
		{_oldFlag -= 0x0004; _flag = _flag | 1 << Entity_Flag.invulnerable};
	
	if _oldFlag >= 0x0002
		{_oldFlag -= 0x0002; _flag = _flag | 1 << Entity_Flag.noTile44};
	
	if _oldFlag >= 0x0001
		{_oldFlag -= 0x0001; _flag = _flag | 1 << Entity_Flag.solid};

	return _flag;
	/*

	NPC FLAGS
	==============
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

/* end convert_classicFlag */
}
