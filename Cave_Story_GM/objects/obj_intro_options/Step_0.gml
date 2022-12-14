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

switch(select)
{
	case(Intro_Option_State.masterVolume):
		if INPUT_ANY_HELD
		{
			if !alarm[0]
			{
				if INPUT_LEFT_HELD {masterVolume = clamp(masterVolume - 1, 0, 255);}
				else if INPUT_RIGHT_HELD {masterVolume = clamp(masterVolume + 1, 0, 255);}
				
				audio_master_gain(masterVolume / 100);
				alarm[0] = !INPUT_JUMP_HELD? 5: 1;
			}
		}
		break;
	
	case(Intro_Option_State.musicVolume):
		if INPUT_ANY_HELD
		{
			if !alarm[0]
			{
				if INPUT_LEFT_HELD {musicVolume = clamp(musicVolume - 1, 0, 255);}
				else if INPUT_RIGHT_HELD {musicVolume = clamp(musicVolume + 1, 0, 255);}
			
				MUSIC.gameSound = MUSIC.gameSound & ~(FullMask._8);
				MUSIC.gameSound = MUSIC.gameSound | musicVolume;
				audio_sound_gain(MUSIC.gameBGM_sound, VOLUME_BGM, 0);
				alarm[0] = !INPUT_JUMP_HELD? 5: 1;
			}
		}
		break;
		
	case(Intro_Option_State.sfxVolume):
		if INPUT_ANY_HELD
		{
			if !alarm[0]
			{
				if INPUT_LEFT_HELD {sfxVolume = clamp(sfxVolume - 1, 0, 255);}
				else if INPUT_RIGHT_HELD {sfxVolume = clamp(sfxVolume + 1, 0, 255);}
			
				MUSIC.gameSound = MUSIC.gameSound & ~(FullMask._8 << 8);
				MUSIC.gameSound = MUSIC.gameSound | (sfxVolume << 8);
				alarm[0] = !INPUT_JUMP_HELD? 5: 1;
			}
			
		}
		break;
		
	case(Intro_Option_State.leave):
		if INPUT_ACTION_PRESSED
		{
			sfx(snd_menuBack);
			instance_destroy();
		}
		break;
}