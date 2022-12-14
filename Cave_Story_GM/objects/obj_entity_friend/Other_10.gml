/// @desc Dir

// Inherit the parent event
event_inherited();

if getBit(flag, Entity_Flag.option2)
{
	flipEntityDirection();
}