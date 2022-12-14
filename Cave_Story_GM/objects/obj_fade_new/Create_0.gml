/// @desc 
depth = LyrDepth.background; // Draws below text and stuff

fadeSurf = -1;
fadeStep = 160;
fadeStepMax = 280;
fadeRadius = 0;
fadeAngle = 0;
fadeIn = false;

fadeMode = 0;
fadeSpeed = 5;
ready = false;

enum fade
{
	mode_out = 0,
	mode_in,
	
	maxFadeStep = 280,
}

x = CAMERA_W / 2;
y = CAMERA_H / 2;