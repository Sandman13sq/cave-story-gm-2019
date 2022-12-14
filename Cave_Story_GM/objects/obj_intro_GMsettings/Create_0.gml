/// @desc 

#region enum Intro_Option_State

enum Intro_GMsettings_State
{
	/*
	polarStar,
	shark,
	grenadeLauncher,
	*/
	
	booster0_1,
	airtank,
	classicFaces,
	classicFade,
	dsFont,
	
	energyGravitate,
	
	debug,
	
	leave,
	
	size,
}

#endregion

menuSize = Intro_GMsettings_State.size;

x = CAMERA_W / 2;
y = 96;

select = 0;

beta = obj_intro.beta;

menuCheck = array_create(menuSize, false);
menuStr = array_create(menuSize, "");

/*
menuStr[Intro_GMsettings_State.polarStar] = "Start with Edge: ";
menuStr[Intro_GMsettings_State.shark] = "Start with Shark: ";
menuStr[Intro_GMsettings_State.grenadeLauncher] = "Start with Grenade Launcher: ";
*/
menuStr[Intro_GMsettings_State.booster0_1] = "Start with Booster v0.1: ";
menuStr[Intro_GMsettings_State.airtank] = "Start with Air Tank: ";
menuStr[Intro_GMsettings_State.classicFaces] = "Use Original Faces: ";
menuStr[Intro_GMsettings_State.classicFade] = "Use Classic Fading: ";
menuStr[Intro_GMsettings_State.dsFont] = "Use Dream Story Font: ";
menuStr[Intro_GMsettings_State.energyGravitate] = "Energy Gravitation: ";
menuStr[Intro_GMsettings_State.debug] = "Show Debug Info: ";
menuStr[menuSize - 1] = "Back";

for (var i = 0; i < menuSize; i++)
{
	switch(i)
	{
		/*
		case(Intro_GMsettings_State.polarStar): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.startWith_edge); break;
			
		case(Intro_GMsettings_State.shark): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.startWith_shark); break;
			
		case(Intro_GMsettings_State.grenadeLauncher): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.startWith_grenadeLauncher); break;
		*/
			
		case(Intro_GMsettings_State.classicFaces): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.classicFaces); break;
			
		case(Intro_GMsettings_State.classicFade): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.classicFade); break;
			
		case(Intro_GMsettings_State.booster0_1): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.startWith_booster0_1); break;
			
		case(Intro_GMsettings_State.airtank): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.startWith_airtank); break;
			
		case(Intro_GMsettings_State.dsFont): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.dreamStoryFont); break;
			
		case(Intro_GMsettings_State.energyGravitate): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.energyGravitation); break;
			
		case(Intro_GMsettings_State.debug): 
			menuCheck[i] = getBit(FLAGS_GM, GM_Flag.debug); break;
	}
}