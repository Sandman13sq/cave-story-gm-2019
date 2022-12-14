/// @desc Fade in or out
/// @arg in?,direction
function screenFade() {

	if !instance_exists(obj_fade)
	{
		// Use new fade if classic bit is not set
		if getBit(FLAGS_GM, GM_Flag.classicFade)
		{
			instance_create_depth(0, 0, 0, obj_fade_classic);
		}
		else
		{
			instance_create_depth(0, 0, 0, obj_fade_new);
		}
	
	}

	with obj_fade
	{
		fadeIn = argument[0];
		fadeMode = argument[1];
		ready = false;
	
		event_user(0);
	}

	setGameplayFlag(Gameplay_Flag.noInput);


}
