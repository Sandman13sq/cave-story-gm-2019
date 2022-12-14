/// @desc 

// Inherit the parent event
event_inherited();

if !waterChange
{
	changeWaterLevel(y + 8 + UNIT_PX / 2);
	waterChange = true;
}