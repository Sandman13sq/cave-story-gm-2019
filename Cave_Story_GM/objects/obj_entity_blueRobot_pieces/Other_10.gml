/// @desc 

// Inherit the parent event
event_inherited();

if getBit(flag, Entity_Flag.option1)
{
	setAnimation(Sequence_blueRobot.scrap1);
}

if getBit(flag, Entity_Flag.option2)
{
	flipEntityDirection();
}