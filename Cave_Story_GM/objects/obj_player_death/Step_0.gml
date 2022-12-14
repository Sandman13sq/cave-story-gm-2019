/// @desc 

if alpha < 1 {alpha = approach(alpha, 1, alphaSpeed);}

if playCount < 5
{
	if timer == 0
	{
		timer = 20;
		
		if playCount > 0
		{
			audio_sound_gain(sfx(snd_playerHurt), volume, 0);
		}
		
		playCount++;
		
		volume *= 0.7;
	}
	
	timer--;
}