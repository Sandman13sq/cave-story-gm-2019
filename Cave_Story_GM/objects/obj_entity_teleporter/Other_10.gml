/// @desc 

// Inherit the parent event
event_inherited();

// Turn Off
if getBit(flag, Entity_Flag.option2)
{
	setEntityState(1);
}