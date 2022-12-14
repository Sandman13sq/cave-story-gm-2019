/// @desc Shows Damage Number on an instance
/// @arg damageNumInst,x_offset,y_offset,value,color,
function displayDamageNum() {

	var _hpChange = healthChangeHold;

	// Show Damage Done
	if _hpChange < 0
	{
		if !healthChangeObj
		{
			healthChangeObj = instance_create_depth(
				x + center_x, y + center_y, 0, obj_damage_num)
		}
	
		var _src = self;
	
		with healthChangeObj
		{
			damage += _hpChange;
			sourceObj = _src;
			alarm[0] = timeToFrames(0, 2);
			wipeHeight = 1;
		}
	}

	// Show Health Recieved
	else if _hpChange > 0
	{
	
	}

	healthChangeHold = 0;


}
