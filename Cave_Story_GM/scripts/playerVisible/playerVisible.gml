/// @desc Sets player visibility
/// @arg visible?
function playerVisible(argument0) {

	if argument0
	{
		with PLAYER
		{
			flag = clearBit(flag, Entity_Flag.hide);
		}
			
		with obj_player_weapon {visible = true;}
	}
	else
	{
		with PLAYER
		{
			flag = setBit(flag, Entity_Flag.hide);
		}
			
		with obj_player_weapon {visible = false;}
	}


}
