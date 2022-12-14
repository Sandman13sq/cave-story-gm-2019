/// @desc Sets appropriate sprite for left and right
function curlySpriteUpdate() {

	if getEquipFlag(Equip_Flag.curly)
	{
		if sprite_index == spr_quote_noWep
		{
			sprite_index = spr_curly_R_noWep;
			setAnimationPallete(spl_curly, GAME.playerPaletteIndex);
		}
		else if sprite_index == spr_quote_wep
		{
			sprite_index = spr_curly_R;
			setAnimationPallete(spl_curly, GAME.playerPaletteIndex);
		}
	
		if entityDirection == Dir.right || getFlag(Entity_Flag.facingRight)
		{
			if sprite_index == spr_curly_L {sprite_index = spr_curly_R;}
			else if sprite_index == spr_curly_L_noWep {sprite_index = spr_curly_R_noWep;}
		}
		else if entityDirection == Dir.left || !getFlag(Entity_Flag.facingRight)
		{
			if sprite_index == spr_curly_R {sprite_index = spr_curly_L;}
			else if sprite_index == spr_curly_R_noWep {sprite_index = spr_curly_L_noWep;}
		}
	}


}
