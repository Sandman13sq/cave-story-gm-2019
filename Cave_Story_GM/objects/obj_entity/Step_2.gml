/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Set Sprite Direction
if entityDirection == Dir.right 
|| entityDirection == Dir.center
{
	image_xflip = 1;
} 

if entityDirection == Dir.left 
{
	image_xflip = -1;
}

// Decrease Shake
if shakeTimer > 0
{
	shakeTimer = max(shakeTimer - 1, 0);
}

if getBit(flag, Entity_Flag.animates)
{
	updateAnimation();
	//animate_endStep();
}