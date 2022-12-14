/// @desc 

// Inherit the parent event
event_inherited();

if getFlag(Entity_Flag.option2)
{
	setEntityState(10);
	setEntityDirection(Dir.left);
}