/// @desc Runs things based on EventFlag
function entityCheckEventFlag() {

	var _flag = ID;

	// Appears if Flag ID matching event is set 
	if flag & 1 << Entity_Flag.flagVisible
	{
		if !getEventFlag(_flag)
		{
			hideInstance();
		}
	}

	// Dissappear if Flag ID matching event is set 
	else if flag & 1 << Entity_Flag.flagInvisible
	{
		if getEventFlag(_flag)
		{
			hideInstance();
		}
	}


}
