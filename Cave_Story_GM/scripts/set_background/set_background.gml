/// @desc 
/// @arg sprite,mode
function set_background() {

	if !instance_exists(Mas.background)
	{
		instance_create_depth(0, 0, LyrDepth.background, Mas.background);
	}

	with (Mas.background)
	{
		bkSprite = argument[0];
		bkMode = argument[1];
		bkColor = -1;
	}


}
