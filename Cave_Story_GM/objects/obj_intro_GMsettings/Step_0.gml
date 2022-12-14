/// @desc 

x = CAMERA_W / 2;
y = 96;

if INPUT_UP_PRESSED 
{
	select = loop(select - 1, 0, menuSize);
	sfx(snd_menuMove);
}

if INPUT_DOWN_PRESSED 
{
	select = loop(select + 1, 0, menuSize);
	sfx(snd_menuMove);
}

if INPUT_BACK_PRESSED
{
	sfx(snd_menuBack);
	instance_destroy();
}

// Flip Flag
if INPUT_ACTION_PRESSED
{
	menuCheck[select] = !menuCheck[select];
	
	var i = select;
	
	if i != Intro_GMsettings_State.leave
	{
		sfx(menuCheck[select]? snd_menuConfirm: snd_menuBack);
	}
	
	switch(i)
	{
		/*
		case(Intro_GMsettings_State.polarStar): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.startWith_edge); break;
			
		case(Intro_GMsettings_State.shark): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.startWith_shark); break;
			
		case(Intro_GMsettings_State.grenadeLauncher): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.startWith_grenadeLauncher); break;
			*/
		case(Intro_GMsettings_State.booster0_1): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.startWith_booster0_1); break;
			
		case(Intro_GMsettings_State.classicFaces): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.classicFaces); break;
			
		case(Intro_GMsettings_State.classicFade): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.classicFade); break;
			
		case(Intro_GMsettings_State.airtank): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.startWith_airtank); break;
			
		case(Intro_GMsettings_State.dsFont): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.dreamStoryFont); 
			FONT_MAIN = getBit(FLAGS_GM, GM_Flag.dreamStoryFont)? 
				global.DreamFont: fnt_main;
			break;
			
		case(Intro_GMsettings_State.energyGravitate): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.energyGravitation); break;
			
		case(Intro_GMsettings_State.debug): 
			FLAGS_GM = flipBit(FLAGS_GM, GM_Flag.debug); 
			DEBUG = getBit(FLAGS_GM, GM_Flag.debug);
			break;
	}
}

switch(select)
{
	case(Intro_GMsettings_State.leave):
		if INPUT_ACTION_PRESSED
		{
			sfx(snd_menuBack);
			instance_destroy();
		}
		break;
}