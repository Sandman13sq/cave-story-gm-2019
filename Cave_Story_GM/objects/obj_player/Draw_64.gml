/// @desc 

draw_reset();

if getGameplayFlag(Gameplay_Flag.showGUI)
{
	draw_update_alpha(guiAlpha);
	
	// HUD Bars
	draw_sprite(spr_UI, 1, Hud.bar_x, Hud.bar_y1);
	draw_sprite(spr_UI, 0, Hud.bar_x, Hud.bar_y2);
	
	#region Exp Bar
	
	if ds_list_size(weaponList) > 0
	{
		if weaponList[| weaponCurrent] != Weapon.none
		{
			// Exp Bar
			if weaponData[? Wep_Data.energy] > 0
			{
				// Exp is less than max
				if weaponData[? Wep_Data.energy] < weaponData[? Wep_Data.energyMax]
				{
					draw_sprite_stretched(spr_UImeter, expFlash? 3: 1, Hud.bar_value_x, Hud.bar_y1, 
						Hud.bar_value_w * 
						(weaponData[? Wep_Data.energy] / weaponData[? Wep_Data.energyMax]), 
						Hud.bar_value_h);
				}
				else
				{
					draw_sprite(spr_UImeter, expFlash? 3: 2, Hud.bar_value_x, Hud.bar_y1);
				}
			}
		}
	}
	
	#endregion
	
	#region Health Bar
	
	draw_sprite_stretched(spr_UImeter, 0, Hud.bar_value_x, Hud.bar_y2, 
		Hud.bar_value_w * (healthPoints / healthPointsMax), Hud.bar_value_h);
		
	#endregion

	#region Weapon
	
	if ds_list_size(weaponList) > 0
	{
		// Backdrop
		draw_sprite(spr_weapon, 0, Hud.weapon_x - weaponX, Hud.weapon_y);

		// Next Weapon
		if weaponX > 0
		{
			draw_update_alpha( abs(weaponX / Hud.weapon_w) * guiAlpha );
			draw_sprite(spr_weapon, 0, Hud.weapon_x - weaponX + Hud.weapon_w, Hud.weapon_y);
			draw_sprite(spr_weapon, (weaponList[| 
				loop(weaponCurrent + 1, 0, ds_list_size(weaponList))]), 
				Hud.weapon_x - weaponX + Hud.weapon_w, Hud.weapon_y);
		}

		// Last Weapon
		else if weaponX < 0
		{
			draw_update_alpha( abs(weaponX / Hud.weapon_w) * guiAlpha );
			draw_sprite(spr_weapon, 0, Hud.weapon_x - weaponX - Hud.weapon_w, Hud.weapon_y);
			draw_sprite(spr_weapon, (weaponList[| 
				loop(weaponCurrent - 1, 0, ds_list_size(weaponList))]), 
				Hud.weapon_x - weaponX - Hud.weapon_w, Hud.weapon_y);
		}

		// Current Weapon
		draw_update_alpha(guiAlpha);
		draw_update_color(c_white);
		draw_sprite(spr_weapon, weaponList[| weaponCurrent], 
			Hud.weapon_x - weaponX, Hud.weapon_y);
			
	}
		
	#endregion
	
	draw_update_alpha(guiAlpha);
	draw_update_font(FONT_MINI);
	draw_set_halign(fa_right);
	
	// Level
	draw_text(Hud.bar_x + 48, Hud.bar_y1, weaponMeta[? Wep_Meta.level]);
	
	// Health
	draw_text(Hud.bar_x + 48, Hud.bar_y2, healthPoints);

	// Ammo
	draw_update_color(c_white);
	draw_reset_align();
	
	if weaponMeta[? Wep_Meta.ammoMax] > 0
	{
		draw_text(Hud.ammo_x, Hud.weapon_y + 8, 
			value_to_string(weaponMeta[? Wep_Meta.ammo], 3) + "/" + 
			value_to_string(weaponMeta[? Wep_Meta.ammoMax], 3));
	}
	// Infinite Ammo
	else {draw_text(Hud.ammo_x, Hud.weapon_y + 8, "--/--");}
}
