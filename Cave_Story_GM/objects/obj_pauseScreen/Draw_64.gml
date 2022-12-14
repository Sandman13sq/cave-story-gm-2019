/// @desc Draw Menus

draw_reset();

draw_set_halign(1);
draw_set_valign(1);

var _x, _y = y - Menu.tabH, _col;

for (var i = 0; i < menuCount; i++)
{
	_x = x + (i * Menu.tabW);
	
	_col = menuSelect == i? c_white: c_gray;
	
	draw_update_color(_col);
	
	draw_9slice_ext_wh(
		sliceSprite, _x, _y,  
		Menu.tabW,  Menu.tabH,
		_col, 1
		);
		
	Dtext(_x + (Menu.tabW / 2), _y + (Menu.tabH / 2), menuTabString[i]);
}

var _col = state > -1? c_white: c_gray;

draw_9slice_ext_wh(sliceSprite, x, y, Menu.w, Menu.h, _col, 1);

draw_update_color(_col);

draw_set_halign(0);
draw_set_valign(0);
	
switch(menuSelect)
{
	#region Weapons
	
	case(0):
		var _l = 16, _pos = 0, _sub;
		
		for (var i = 0; i < _l; i++)
		{
			if getEquipFlag(i)
			{
				switch(i)
				{
					case(Equip_Flag.radar): _sub = Item.mapSystem; break;
					case(Equip_Flag.booster0_8): _sub = Item.booster0_8; break;
					case(Equip_Flag.booster2_0): _sub = Item.booster2_0; break;
					case(Equip_Flag.whimsicalStar): _sub = Item.whimsicalStar; break;
					case(Equip_Flag.airTank): _sub = Item.airTank; break;
					case(Equip_Flag.curly): _sub = pantyBit? Item.curlyPanties: Item.ironBond; break;
				}
				
				draw_sprite_ext(spr_item, _sub, x + 16 + (_pos * 64), y + 16,
					1, 1, 0, _col, 1);
				_pos++;
			}
		}
		
		if ds_list_size(weaponList) <= 0
		{
			var _w = Menu.w, _x = x + (Menu.w / 2), _y = y + (Menu.h / 2);
			
			draw_update_color(_col);
			draw_set_halign(1);
			draw_set_valign(1);
			Dtext(_x, _y, "No Weapons");
		}
		else
		{
			var _x = x + 16, _y = y + 80, _range = 5,
			_w = surface_get_width(menuSurf),
			_h = Menu.wepSep * _range;
		
			if in_range(weaponCurrent, selectOffset[menuSelect], selectOffset[menuSelect] + _range - 1)
			{
				var _yWep = _y + ( (weaponCurrent ) * Menu.wepSep);
			
				draw_shape_rect(
					_x, _yWep - 8 - y_offset, 
					x + Menu.w - 16, _yWep + Menu.wepSep - 8 - y_offset, 
					c_white, 0.2);
			}
			
			if highlightStep
			{
				var _yWep = _y + ( (select[menuSelect] ) * Menu.wepSep);
			
				draw_shape_border(_x, _yWep - 8 - y_offset, 
					x + Menu.w - 16, _yWep + Menu.wepSep - 8 - y_offset, 4, c_white, 0.4);
			}
		
			draw_surface_part_ext(menuSurf, 0, y_offset, 
				_w, _h, _x, _y,
				1, 1, _col, 1);
		}
		break;
	
	#endregion
	
	#region Items
	
	case(1):
		if ds_list_size(itemList) <= 0
		{
			var _w = Menu.w, _x = x + (Menu.w / 2), _y = y + (Menu.h / 2);
			
			draw_update_color(_col);
			draw_set_halign(1);
			draw_set_valign(1);
			Dtext(_x, _y, "No Items");
		}
		else
		{
			var _x = x + 16, _y = y + 24, _range = Menu.itemPerColumn,
			_w = surface_get_width(menuSurf),
			_h = Menu.itemYsep * _range;
			
			if highlightStep
			{
				var _sel = select[menuSelect];
			
				draw_shape_border_wh(
					_x + ( Menu.itemXsep * (_sel mod Menu.itemPerRow) ), 
					_y - y_offset + ( Menu.itemYsep * (_sel div Menu.itemPerRow) ), 
					64, 
					32, 
					4, c_white, 0.4);
			}
		
			draw_surface_part_ext(menuSurf, 0, y_offset, 
				_w, _h, _x, _y,
				1, 1, _col, 1);
		}
		break;
	
	#endregion
	
	#region Options
	
	case(2):
		
		var _x = x + 32, _y = y + 32, _h = 32, _pos = 0, 
		_val, _sprH = sprite_get_height(spr_UIbar);
		
		draw_update_color(_col);
		
		draw_shape_rect_wh(getEquipFlag(Equip_Flag.curly)? _x + 64: _x, 
			_y, 64, 64, _col, 0.2);
			
		if select[menuSelect] == 5 && highlightStep
		{
			draw_shape_border_wh(getEquipFlag(Equip_Flag.curly)? _x + 64: _x, 
			_y, 64, 64, 4, c_white, 0.6);
		}
		
		pal_swap_set(spl_quote, PLAYER.animationPalIndex, false);
		draw_sprite_ext(spr_quote_noWep, 0, _x, _y, 2, 2, 0, _col, 1);
		
		pal_swap_set(spl_curly, PLAYER.animationPalIndex, false);
		draw_sprite_ext(spr_curly_R, 0, _x + 64, _y, 2, 2, 0, _col, 1);
		pal_swap_reset();
		
		_x = x + 180;
		
		for (var i = 0; i < 2; i++)
		{
			if highlightStep
			{
				if select[menuSelect] == i
				{
					draw_shape_border_wh(_x, _y, 192, _h, 4, _col, 0.4);
				}
			}
			Dtext(_x + 4, _y + 4, optionString[_pos]);
			_pos++;
			
			_y += _h;
		}
		
		_x = x + 32;
		_y = y + 100;
		
		for (var i = 2; i < 5; i++)
		{
			if highlightStep
			{
				if select[menuSelect] == i
				{
					draw_shape_border_wh(_x, _y, 240, _h, 4, _col, 0.4);
				}
			}
			
			Dtext(_x + 4, _y + 4, optionString[_pos]);
			_pos++;
			
			switch(i)
			{
				case(2): _val = masterVolume; break;
				case(3): _val = musicVolume; break;
				case(4): _val = sfxVolume; break;
			}
			
			draw_update_font(FONT_MINI);
			
			draw_UIbar(spr_UIbar, _col, _x + 250, _y + 8, 128, _val, 255);
			
			draw_text(_x + 256 + 132, _y + 8, _val);
			
			_y += _h;
			
			draw_update_font(FONT_MAIN);
		}
		
		if highlightStep
		{
			if select[menuSelect] == i
			{
				draw_shape_border_wh(_x, _y, 240, _h, 4, _col, 0.4);
			}
		}
		Dtext(_x + 4, _y + 4, optionString[_pos]);
		
		break;
	
	#endregion
}

/*
draw_string_list(90, 90, 
	bitString(FLAGS_EQUIP, 16),
	bitString(1 << Equip_Flag.booster0_8, 16),
	bitString(1 << Equip_Flag.booster2_0, 16),
	bitString(1 << Equip_Flag.radar, 16),
	);