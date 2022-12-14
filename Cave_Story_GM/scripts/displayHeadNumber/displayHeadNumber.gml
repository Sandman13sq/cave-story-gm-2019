/// @desc Displays number above instance
/// @arg value,type,x_offset,y_offset,*delay,*add?,*time
function displayHeadNumber() {

	var _val = argument[0], _type = argument[1],
	_x = argument[2], _y = argument[3],
	_delay = argument_count > 4? argument[4]: 0,
	_add = argument_count > 5? argument[5]: false,
	_time = argument_count > 6? argument[6]: Head_Number.time,
	_inst = noone;

	with obj_headNumber
	{
		if SOURCE == other {_inst = id;}
	}

	if _inst == noone
	{
		_inst = instance_create_dependent(self, obj_headNumber);
	
		with _inst 
		{
			depth = LyrDepth.maxFront + round(depth / 100);
		}
	}

	with _inst
	{
		value[_type] = _add? value[_type] + _val: _val;
		height[_type] = 1;
		flash[_type] = Head_Number.flash;
	
		delay[_type] = _delay;
		timer[_type] = _time;
		active[_type] = _delay <= 0;
	
		x_offset = _x;
		y_offset = _y;
	
		x = SOURCE.x + x_offset;
		y = SOURCE.y + y_offset;
	
		count = 0;
		for (var i = 0; i < 4; i++)
		{
			if active[i] {count++;}
		}
	}

	return _inst;


}
