/// @desc Damaged

// Inherit the parent event
event_inherited();

if state == 0
{
	setEntityState(2);
	alarm[11] = jump_time;
}