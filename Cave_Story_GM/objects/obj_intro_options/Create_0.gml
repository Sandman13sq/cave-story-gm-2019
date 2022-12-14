/// @desc 

#region enum Intro_Option_State

enum Intro_Option_State
{
	masterVolume,
	musicVolume,
	sfxVolume,
	
	leave,
	
	size,
}

#endregion

menuSize = Intro_Option_State.size;

x = CAMERA_W / 2;
y = 96;

select = 0;

beta = obj_intro.beta;

menuCheck = array_create(menuSize, false);
menuStr = array_create(menuSize, "");

menuStr[Intro_Option_State.masterVolume] = "Master Volume";
menuStr[Intro_Option_State.musicVolume] = "Music Volume";
menuStr[Intro_Option_State.sfxVolume] = "SFX Volume";
menuStr[Intro_Option_State.leave] = "Back";

masterVolume = round(audio_get_master_gain(0) * 100);
musicVolume = round(VOLUME_BGM * 100);
sfxVolume = round(VOLUME_SFX * 100);