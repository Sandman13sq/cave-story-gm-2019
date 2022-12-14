/// @desc 

if stageCount > 0
{
	event_user(0);
}

if state
{
	alpha = approach(alpha, 0, 0.05);
	if alpha == 0
	{
		instance_destroy();
	}
}
else
{
	alpha = approach(alpha, 0.5, 0.05);

	if theta != thetaTarget
	{
		theta = approach(theta, thetaTarget, thetaSpeed);
	
		if theta == thetaTarget
		{
			thetaTarget = loop(thetaTarget, 0, 360);
			theta = thetaTarget;
		}
	}

	if INPUT_ANY_PRESSED
	{
		if stageCount == 0
		{
			end_event();
			state = 1;
		}
		else
		{
			if INPUT_ACTION_PRESSED
			{
				runEvent(stageEvent[select]);
				state = 1;
			}
			else if INPUT_BACK_PRESSED
			{
				runEvent(0);
				state = 1;
			}
			else
			{
				if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
				{
					select = loop(select + 1, 0, stageCount);
					thetaTarget += angleSep;
				}
			
				if INPUT_LEFT_PRESSED || INPUT_UP_PRESSED
				{
					select = loop(select - 1, 0, stageCount);
					thetaTarget -= angleSep;
				}
			
				runEvent(1000 + stageIndex[select], tempScript);
			}
		}
	}
}