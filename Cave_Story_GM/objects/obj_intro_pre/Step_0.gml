/// @desc 

if INPUT_ACTION_PRESSED
{
	instance_destroy();
}
else
{
	switch(state)
	{
		case(0):
			if disclaimerAlpha[0] < 1 {disclaimerAlpha[0] += 0.05}
			if timer < 100 {timer++}
			else {timer = 0; state++}
			break;
	
		case(1):
			if disclaimerAlpha[1] < 1 {disclaimerAlpha[1] += 0.05}
			if timer < 200 {timer++}
			else {timer = 0; state++}
			break;
		
		case(2):
			if disclaimerAlpha[0] > 0 {disclaimerAlpha[0] -= 0.05}
			if disclaimerAlpha[1] > 0 {disclaimerAlpha[1] -= 0.05}
			if timer < 60 {timer++}
			else {timer = 0; state++}
			break;
	
		case(3):
			CAMERA_Y = (CAMERA_Y * 0.94);
		
			if alpha > 0 {alpha -= 0.01}
			if abs(CAMERA_Y) < 0.5
			{timer = 0; instance_destroy();}
			break;
	}
}