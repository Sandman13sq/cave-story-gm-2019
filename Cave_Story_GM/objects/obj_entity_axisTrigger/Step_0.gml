/// @desc 

// Inherit the parent event
//event_inherited();

if FREEZE {exit;}

if !waitTimer
{
	if event > -1
	if !instance_exists(EVENT)
	{
		/*
		// Vertical
		if flag & 1 << Entity_Flag.option2
		{
			var _size = 128;
			if point_in_rectangle(PLAYER_X, PLAYER_Y,
				x, y - _size, 
				x + UNIT_PX, y + _size + UNIT_PX
				)
			{
				runEvent(event);
			}
		}
		// Horizontal
		else
		{
			var _size = 128;
			if point_in_rectangle(PLAYER_X, PLAYER_Y,
				x - _size, y, 
				x + _size + UNIT_PX, y + UNIT_PX
				)
			{
				runEvent(event);
			}
		}
		*/
		if instance_exists(PLAYER)
		{
			var _l = instance_number(PLAYER), _inst;
			
			for (var i = 0; i < _l; i++)
			{
				_inst = instance_find(PLAYER, i);
				
				if point_in_rectangle(getCenterX(_inst), getCenterY(_inst),
					axisX1, axisY1, axisX2, axisY2)
				{
					runEvent(event);
					waitTimer = 60;
				}
			}
		}
	}
}
else {if !instance_exists(EVENT) waitTimer--;}