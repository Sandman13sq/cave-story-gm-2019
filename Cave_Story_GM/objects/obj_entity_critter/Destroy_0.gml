/// @desc 

// Inherit the parent event
event_inherited();

if healthPointsMax > 0 && healthPoints == 0
{
	with create_entityKO(spr_critter, 6)
	{
		animationPalSprite = other.animationPalSprite;
		animationPalIndex = other.animationPalIndex;
	}
}