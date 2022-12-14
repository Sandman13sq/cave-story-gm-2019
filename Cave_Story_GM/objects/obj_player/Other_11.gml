/// @desc Update Sprite Set

// Inherit the parent event
event_inherited();

if getEquipFlag(Equip_Flag.curly)
{
	playerSpriteSet[0] = spr_curly_R_noWep;
	playerSpriteSet[1] = spr_curly_R;
	
	setAnimationPallete(spl_curly, GAME.playerPaletteIndex);
	update_weapon(false);
}
else
{
	playerSpriteSet[0] = spr_quote_noWep;
	playerSpriteSet[1] = spr_quote_wep;
	
	setAnimationPallete(spl_quote, GAME.playerPaletteIndex);
	update_weapon(false);
}
