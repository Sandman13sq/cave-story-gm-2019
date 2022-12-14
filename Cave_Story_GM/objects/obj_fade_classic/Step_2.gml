/// @desc 

// Fade To Black
if !fadeIn
{
	if fadeStep < fadeStepMax
	{
		fadeStep = approach(fadeStep, fadeStepMax, 1);
	}
	else {ready = true;}
}
// Fade From Black
else
{
	if fadeStep > -10
	{
		fadeStep = approach(fadeStep, -10, 1);
	}
	else {ready = true;}
}