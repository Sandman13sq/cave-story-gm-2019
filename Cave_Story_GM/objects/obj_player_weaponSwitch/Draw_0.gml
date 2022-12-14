/// @desc 
draw_reset();

var _wep, _x, _size = ds_list_size(weaponList), _side = min(_size - 1, 2);

draw_sprite(spr_weapon, 0, x, y);
for (var i = -_side; i <= _side; i++)
{
	_wep = weaponList[| loop(i + weaponCurrent, 0, _size)];
	_x = i * UNIT_PX + x - PLAYER.weaponX;
	
	if i == 0
	{
		draw_sprite(spr_weapon, _wep, _x, y);
	}
	else
	{
		draw_sprite_ext(spr_weapon, _wep, _x, y,
			1, 1, 0, c_gray, 1);
	}
}