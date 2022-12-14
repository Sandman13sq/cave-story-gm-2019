/// @desc Deals with hidden entities
function updateHiddenEntity() {

	with obj_hiddenEntity
	{
		// Appears if Flag ID matching event is set 
		if flag & 1 << Entity_Flag.flagVisible
		{
			if getEventFlag(ID)
			{
				instance_activate_object(hiddenInst);
				instance_destroy();
			}
		}

		// Dissappear if Flag ID matching event is set 
		else if flag & 1 << Entity_Flag.flagInvisible
		{
			if !getEventFlag(ID)
			{
				instance_activate_object(hiddenInst);
				instance_destroy();
			}
		}
	}


}
