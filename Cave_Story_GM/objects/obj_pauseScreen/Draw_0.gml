/// @desc Draw Weapons & Items

switch(menuSelect)
{
	#region Weapons
	
	case(0):
		if !surface_exists(menuSurf)
		{
			draw_reset();
			
			var _w = Menu.w - 32, _h = Menu.wepSep, 
			_l = ds_list_size(weaponList),
			_meta, _data, _wep, _x = 0, _y = 0;
			menuSurf = surface_create(_w, max(_h * _l, 1));
			
			surface_set_target(menuSurf);
			
			draw_clear_alpha(0, 0);
			
			for (var i = 0; i < _l; i++)
			{
				_wep = weaponList[| i];
				_meta = getWeaponMeta(0, _wep);
				_data = getWeaponData(0, _wep);
			
				draw_sprite(spr_weapon, _wep, _x + 4, _y - 4);
			
				draw_update_font(FONT_MINI);
			
				// Exp
				draw_text(_x + 128, _y, 
					string(_data[? Wep_Data.energy]) + "/" + string(_data[? Wep_Data.energyMax]));
				draw_meter_wh(_x + 128, _y + 16, 80, 12, 
					_data[? Wep_Data.energy], _data[? Wep_Data.energyMax],
					state > -1? c_exp: c_gray, state > -1? c_maroon: c_black, 1
					);
			
				draw_update_font(FONT_MAIN);
			
				// Level
				Dtext(_x + 56, _y, "Lvl " + string(_meta[? Wep_Meta.level]) );
				
				draw_update_font(FONT_MINI);
			
				// Ammo
				if _meta[? Wep_Meta.ammoMax] == 0
				{
					draw_text(_x + 256, _y, "---/---");
				}
				else
				{
					draw_text(_x + 256, _y, 
						value_to_string(_meta[? Wep_Meta.ammo], 3) + "/" +
						value_to_string(_meta[? Wep_Meta.ammoMax], 3)
						);
				}
			
				_y += Menu.wepSep;
			}
			
			surface_reset_target();
		}
		break;
		
	#endregion
	
	#region Items
	
	case(1):
		if !surface_exists(menuSurf)
		{
			draw_reset();
			
			var _w = Menu.w - 32, _h = Menu.itemYsep, 
			_l = ds_list_size(itemList),
			_meta, _data, _item, _x = 0, _y = 0;
			menuSurf = surface_create(_w, _h * max( (_l div Menu.itemPerRow) + 1, Menu.itemPerColumn) );
			
			surface_set_target(menuSurf);
			
			draw_clear_alpha(0, 0);
			
			for (var i = 0; i < _l; i++)
			{
				_item = itemList[| i];
			
				draw_sprite(spr_item, _item, 
					_x + (Menu.itemXsep * (i mod Menu.itemPerRow)), 
					_y + (Menu.itemYsep * (i div Menu.itemPerRow))
					);
			}
			
			surface_reset_target();
		}
		break;
		
	#endregion
	
	#region Options
	
	case(2):
		
		break;
	
	#endregion
}