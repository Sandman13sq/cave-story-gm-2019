/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED 
{
	var i = 0;
	
	while (i < 2)
	{
		if chargePosition[i] >= chargeMax[i] {i++}
		else {break;}
	}
	
	chargeMode = i;
	chargePosition[i] = max(chargePosition[i] - 1, 0);
	
	if starAlpha > 0 {starAlpha -= 0.05}
	
	exit;
}

// Inherit the parent event
event_inherited();

starAngle = loop(starAngle + 15, 0, 360);

#region Fire Laser

if INPUT_SHOOT_RELEASED
{
	if chargeMode > 0
	{
		var _dir = direction, _speed = 10, _inst;
	
		_inst = spawn_projectile(obj_projectile_spurLaser, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir), 
			self)
			
			
		switch(chargeMode)
		{
			case(1):
				with _inst
				{
					set_projectile(1, _speed, _dir, -1, 1);
					radius = 1;
				}
				sfx_at(snd_spur_fireLv1, SOURCE.x, SOURCE.y, 0);
				break;
				
			case(2):
				if chargePosition[chargeMode] != chargeMax[chargeMode]
				{
					with _inst
					{
						set_projectile(2, _speed, _dir, -1, 1);
						radius = 5;
						pierce = true;
					}
					sfx_at(snd_spur_fireLv2, SOURCE.x, SOURCE.y, 0);
				}
				else
				{
					with _inst
					{
						set_projectile(4, _speed, _dir, -1, 1);
						radius = 10;
						pierce = true;
					}
					sfx_at(snd_spur_fireLv3, SOURCE.x, SOURCE.y, 0);
				}
				break;
		}
		
		cooldown = 50;
	}
}

#endregion

#region Charge Laser

if INPUT_SHOOT_HELD
{
	var _lastCharge = chargePosition[chargeMode];
	
	var i = 0;
	
	while (i < 2)
	{
		if chargePosition[i] >= chargeMax[i] {i++}
		else {break;}
	}
	
	chargeMode = i;
	chargePosition[i] = min(chargeMax[i], chargePosition[i] + 1);
	
	if starAlpha < 1 {starAlpha += 0.05}
	starRadius = approach_grad(starRadius, 16, 16);
	
	var _dir = direction, _dist = 32, 
	_xspeed = SOURCE.x_speed, _yspeed = SOURCE.y_speed,
	_x = SOURCE.x + UNIT_PX / 2 + lengthdir_x(weapon_muzzleSide, _dir),
	_y = SOURCE.y + UNIT_PX / 2 + lengthdir_y(weapon_muzzleUp, _dir);
	
	with effect_homingPower(
		_x + lengthdir_x(_dist + irandom(10), irandom(360)), 
		_y + lengthdir_y(_dist + irandom(10), irandom(360)), 
		_x, _y, 4, 1, 20, depth - 1, [c_white, c_black], [1, 0]
		)
	{
		hspeed = _xspeed;
		vspeed = _yspeed;
	}
	
	if chargePosition[chargeMode] == chargeMax[chargeMode] 
	&& chargePosition[chargeMode] != _lastCharge
	&& chargeMode >= 2
	{
		sfx_at(snd_spur_charged, SOURCE.x, SOURCE.y, 0);
	}
	
	#region Spur Sound

	if !(CURRENT_FRAME mod 3)
	{
		var _snd = -1;
		switch(chargeMode)
		{
			case(0):
				_snd = snd_spur_chargeLv1;
				break;
			
			case(1):
				_snd = snd_spur_chargeLv2;
				break;
			
			case(2):
				if chargePosition[chargeMode] != chargeMax[chargeMode]
				{
					_snd = snd_spur_chargeLv3;
				}
				break;
		}

		if _snd != -1 {sfx_at(_snd, SOURCE.x, SOURCE.y, 0);}
	}

	#endregion
	
}

#endregion

// No Charge
else
{
	var i = 0;
	
	while (i < 2)
	{
		if chargePosition[i] >= chargeMax[i] {i++}
		else {break;}
	}
	
	chargeMode = i;
	chargePosition[i] = max(chargePosition[i] - 1, 0);
	
	if starAlpha > 0 {starAlpha -= 0.05}
}

// Shoot Lv3 Polar Star Shot
if INPUT_SHOOT_PRESSED
{
	chargePosition[0] = 0;
	chargePosition[1] = 0;
	chargePosition[2] = 0;
	chargeMode = 0;
	starRadius = 64;
	
	if !cooldown
	{
		var _dir = direction;
	
		part_particles_create(PART_SYS_FRONT, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir), 
			getPartType(Part_Index.shotSpark), 1);
	
		with spawn_projectile(obj_projectile_single, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir), 
			self)
		{
			set_projectile(4, 8, _dir, 32, 1);
			set_projectile_sprite(spr_proj_big, 3);
		}
		sfx_at(snd_polarStar_shotLV3, PLAYER_X, PLAYER_Y, 0);
	}
}

if cooldown {cooldown--;}

if starAlpha > 0
{
	// Charge Color
	chargeColor = merge_color(c_thirdBar, c_white, ( dsin(CURRENT_FRAME * 4) + 1 ) / 2 );
}