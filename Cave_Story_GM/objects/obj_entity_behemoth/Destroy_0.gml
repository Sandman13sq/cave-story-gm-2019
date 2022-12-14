/// @desc 

// Inherit the parent event
event_inherited();

if healthPointsMax > 0 && healthPoints == 0
{
	create_entityKO(spr_behemoth, 3);
}