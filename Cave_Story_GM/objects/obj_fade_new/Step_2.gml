/// @desc 

x = CAMERA_W / 2;
y = CAMERA_H / 2;

// Fade To Black
if ( !fadeIn )
{
	if (fadeStep == 0)
	{
		ready = true;
	}
	
	if fadeStep > 0 {fadeStep = max(0, fadeStep - (fadeSpeed * (INPUT_ALT_HELD? 2: 1)))}
}
// Fade From Black
else
{
	if fadeStep < fadeStepMax
	{
		fadeStep = min(fadeStepMax, fadeStep + (fadeSpeed * (INPUT_ALT_HELD? 2: 1)))
	}
	else 
	{
		ready = true; if !instance_exists(mas_event) {instance_destroy()}
	}
}

fadeRadius = power(fadeStep, 1.3);
fadeAngle = fadeRadius / 2;

