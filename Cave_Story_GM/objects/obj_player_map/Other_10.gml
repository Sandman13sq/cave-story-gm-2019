/// @desc Update Position

x = (CAMERA_W - (stage_drawMaxW * stage_scale) ) / 2;
y = (CAMERA_H - (stage_drawMaxH * stage_scale) ) / 2 + 20;

if INPUT_RIGHT_HELD
{
	viewX = clamp(viewX + viewSpeed, 0, (stage_width - stage_drawMaxW) * cellSize);
}

if INPUT_LEFT_HELD
{
	viewX = clamp(viewX - viewSpeed, 0, (stage_width - stage_drawMaxW) * cellSize);
}

if INPUT_UP_HELD
{
	viewY = clamp(viewY - viewSpeed, 0, (stage_height - stage_drawMaxH) * cellSize);
}

if INPUT_DOWN_HELD
{
	viewY = clamp(viewY + viewSpeed, 0, (stage_height - stage_drawMaxH) * cellSize);
}

if INPUT_BACK_PRESSED
{
	instance_destroy();
}

maxView = 0;

if viewX > 0 
	{maxView = setBit(maxView, 0)}
if viewX + ( stage_drawMaxW * cellSize ) < ( (stage_width) * cellSize ) 
	{maxView = setBit(maxView, 1)}
if viewY > 0 
	{maxView = setBit(maxView, 2)}
if viewY + ( stage_drawMaxH * cellSize ) < ( (stage_height) * cellSize )
	{maxView = setBit(maxView, 3)}