/// @desc 

// Inherit the parent event
event_inherited();

if healthPointsMax > 0 && healthPoints == 0
{
	create_entityKO(sprite_index, 4);
}