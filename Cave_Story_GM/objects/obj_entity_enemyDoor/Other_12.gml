/// @desc Damage Script

// Inherit the parent event
event_inherited();

setEntityState(1);
setAnimation(Sequence_door.hurt);

if healthPoints == 0
{
	// I believe this is required
	setEventFlag(0301);
}