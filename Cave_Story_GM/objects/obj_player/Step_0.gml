/// @desc 

var _lastYspeed = y_speed;

#region Debug

//if flag & 1 << Entity_Flag.debug
{
	if mouse_check_button(mb_right)
	{
		x = mouse_x - center_x;
		y = mouse_y - center_y;
		x_speed = 0;
		y_speed = 0;
		setFlag(Entity_Flag.inAir);
		exit;
	}
}

#endregion

// Don't Do step if Game Freeze
if FREEZE {exit;}

playerFlag = clearBit(playerFlag, Player_Flag.lookingBack);

var _airLast = getFlag(Entity_Flag.inAir), 
_xspeedLast = x_speed, _yspeedLast = y_speed,
_moving = false;

#region Determine State

var _tile = COLLMAP[# (x + center_x) div UNIT_PX, (y + center_y) div UNIT_PX],
_inWater = false, _waterLast = state;

if instance_exists(obj_waterLevel)
{
	if y + center_y >= obj_waterLevel.y
	{
		_inWater = true;
	}
}

if !_inWater
{
	if isWaterTile(_tile)
	{
		_inWater = true;
	}
}

state = _inWater;

if _waterLast != state
{
	part_particles_create_region(PART_SYS_PLAYER, 
		MY_X - 16, MY_Y,
		MY_X + 16, MY_Y,
		getPartType(Part_Index.waterEnter), 10
		);
		
	sfx_at(snd_splash, MY_X, MY_Y, 0, false);
		
	// Entering water
	if !_waterLast
	{
		if getEquipFlag(Equip_Flag.airTank)
		{
			airMeterObj = instance_create_dependent(self, obj_airTank);
		}
		else
		{
			airMeterObj = instance_create_dependent(self, obj_airMeter);
		}
	}
	// Leaving water
	else
	{
		with airMeterObj
		{
			instance_destroy();
		}
	}
}

#endregion

#region Collision Step Copy

// UPDATE THIS WITH PARENT CODE's CHANGES

run_flags();
setFlag(Entity_Flag.inAir);

x += x_speed;
y += y_speed;

if !(flag & 1 << Entity_Flag.ignoreSolid)
{
	#region Gravity
	
	if getFlag(Entity_Flag.inAir)
	{
		if !(flag & 1 << Entity_Flag.skipGrav)
		{
			// Use Original Speed
			if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.eventRunning)
			{
				y_speed = min(y_speed + pixToDec(0x50), pixToDec(0x5FF))
			}
			else
			{
				if ( y_speed < y_acc_max[state] )
				{
					y_speed = min(y_speed + (jump_hold? jump_acc[state]: y_acc[state]), y_acc_max[state])
				}
			}
		}
		else {flag = flag | 1 << Entity_Flag.skipGrav}
	}
	
	#endregion
	
	#region Tile Collision
	
	var _pos, _in = 4, _x = x + center_x, _y = y + center_y;
	
	// Stay in place if collision on all sides
	
	if !is_undefined( tile_position(x + x_left, _y, 0) )
	&& !is_undefined( tile_position(_x, y + y_down, 1) )
	&& !is_undefined( tile_position(x + x_right, _y, 2) )
	&& !is_undefined( tile_position(_x, y + y_up, 3) )
	{
		collisionDirection = 7;
		x_speed = 0;
		y_speed = 0;
		
		x = UNIT_PX * (x div UNIT_PX) + UNIT_PX / 2;
		y = UNIT_PX * (y div UNIT_PX) + UNIT_PX / 2;
		clearFlag(Entity_Flag.inAir);
	}
	else
	{
		collisionDirection = 0;
	
		// Ground Collision
		_pos = tile_position(_x, y + y_down - 1, 1)
	
		if !is_undefined(_pos)
		{
			y -= 1;
			collisionDirection = setBit(collisionDirection, Dir.down);
			//clearFlag(Entity_Flag.inAir);
		}
		
		//cout(getFlag(Entity_Flag.inAir)? "In Air": "On Ground")
		
		if y_speed > 0 && !getFlag(Entity_Flag.inAir)
		{
			for (var i = 1; i >= 0; i--)
			{
				_pos = tile_position(_x, y + y_down + i, 1);
	
				if !is_undefined(_pos)
				{
					tileCurrent = tile_collision_index_point(x + center_x, y + y_down);
					y = _pos - y_down;
					y_speed = min(y_speed, 1);
					lastColl = 1;
					collisionDirection = setBit(collisionDirection, Dir.down);
					clearFlag(Entity_Flag.inAir);
					break;
				}
			}
		}
		
		_pos = tile_position(_x, y + y_down - 1, 1);
	
		for (var i = 3; i >= 0; i--)
		{
			_pos = tile_position(_x, y + y_down - i, 1);
	
			if !is_undefined(_pos)
			{
				tileCurrent = tile_collision_index_point(x + center_x, y + y_down);
				y = _pos - y_down;
				y_speed = min(y_speed, 1);
				lastColl = 1;
				collisionDirection = setBit(collisionDirection, Dir.down);
				clearFlag(Entity_Flag.inAir);
				break;
			}
		}
	
		if is_undefined(_pos)
		{
			_pos = tile_position(_x, y + y_down + 2, 1);
		
			if !is_undefined(_pos) && !getFlag(Entity_Flag.inAir) && y_speed >= 0
			{
				tileCurrent = tile_collision_index_point(x + center_x, y + y_down + 2);
				y = _pos - y_down;
				lastColl = 1;
				collisionDirection = setBit(collisionDirection, Dir.down);
				clearFlag(Entity_Flag.inAir);
			}
		}
		
		// Top Collision
		_in = 4;
	
		_pos = tile_position(x + x_left + _in, y + y_up, 3); // Up Left
	
		if !is_undefined(_pos)
		{
			y = _pos - y_up;
			if y_speed < 0 {y_speed = 0;}
			lastColl = 3;
			collisionDirection = setBit(collisionDirection, Dir.up);
		}
	
		_pos = tile_position(x + x_right - _in, y + y_up, 3); // Up Right
	
		if !is_undefined(_pos)
		{
			y = _pos - y_up;
			if y_speed < 0 {y_speed = 0;}
			lastColl = 3;
			collisionDirection = setBit(collisionDirection, Dir.up);
		}
		
		_pos = tile_position(x + center_x, y + y_up, 3); // Up
	
		if !is_undefined(_pos)
		{
			y = _pos - y_up;
			if y_speed < 0 {y_speed = 0;}
			lastColl = 3;
			collisionDirection = setBit(collisionDirection, Dir.up);
		}
	
		if getBit(collisionDirection, Dir.up) && y_speed == 0 && getFlag(Entity_Flag.inAir)
		{
			part_particles_create(PART_SYS_FRONT, _x, y + y_up, 
				getPartType(Part_Index.headBonk), 2);
		}
		
		_in = 10;
		
		// Side Collision
		if getFlag(Entity_Flag.inAir)
		{
			// Right Side collision
			_pos = tile_position(x + x_right, y + y_down - _in, 2);
		
			if !is_undefined(_pos)
			{
				x = _pos - x_right;
				x_speed = min(x_speed, 0); lastColl = 2;
				collisionDirection = setBit(collisionDirection, Dir.right);
			}
			
			// Left Side collision
			_pos = tile_position(x + x_left, y + y_down - _in, 0);
		
			if !is_undefined(_pos)
			{
				x = _pos - x_left;
				x_speed = max(x_speed, 0); lastColl = 0;
				collisionDirection = setBit(collisionDirection, Dir.left);
			}
		}
		
		// Right
		_pos = tile_position(x + x_right, y + y_up + _in, 2);
		
		if !is_undefined(_pos)
		{
			x = _pos - x_right;
			x_speed = min(x_speed, 0); lastColl = 2;
			collisionDirection = setBit(collisionDirection, Dir.right);
		}
		
		// Left
		_pos = tile_position(x + x_left, y + y_up + _in, 0);
		
		if !is_undefined(_pos)
		{
			x = _pos - x_left;
			x_speed = max(x_speed, 0); lastColl = 0;
			collisionDirection = setBit(collisionDirection, Dir.left);
		}
	}
	
	#endregion
	
	#region Entity Collision
	
	var _list = list_create(), _l, _inst, _s = 4, _pos;
	
	// Moving left
	_l = collision_rectangle_list(
		x + x_left - _s, y + y_up + _s, x + x_left, y + y_down - _s,
		ENTITY, false, true, _list, false);
	
	for (var i = 0; i < _l; i++)
	{
		_inst = _list[| i];
		
		if _inst.attackPower > 0 
		{
			if entityCollision(self, _inst) {addHealth(-_inst.attackPower);}
		}
		
		if getBit(_inst.flag, Entity_Flag.solid)
		{
			if x + x_left < _inst.x + _inst.x_right
			{
				x = _inst.x + _inst.x_right - x_left;
				x_speed = 0;
			}
		}
	}
	
	ds_list_clear(_list);
	
	// Moving Right
	_l = collision_rectangle_list(
		x + x_right, y + y_up + _s, x + x_right + _s, y + y_down - _s,
		ENTITY, false, true, _list, false);
	
	for (var i = 0; i < _l; i++)
	{
		_inst = _list[| i];
		
		if _inst.attackPower > 0 
		{
			if entityCollision(self, _inst) {addHealth(-_inst.attackPower);}
		}
		
		if getBit(_inst.flag, Entity_Flag.solid)
		{
			// Moving Right
			if x + x_right > _inst.x + _inst.x_left
			{
				x = _inst.x + _inst.x_left - x_right;
				x_speed = 0;
			}
		}
	}
	
	// Moving Up
	_l = collision_rectangle_list(
		x + x_left + _s, y + y_up - _s, x + x_right - _s, y + y_up,
		ENTITY, false, true, _list, false);
	
	for (var i = 0; i < _l; i++)
	{
		_inst = _list[| i];
		
		if _inst.attackPower > 0 
		{
			if entityCollision(self, _inst) {addHealth(-_inst.attackPower);}
		}
		
		if getBit(_inst.flag, Entity_Flag.solid)
		{
			// Moving Up
			if y + y_up < _inst.y + _inst.y_down
			{
				y = _inst.y + _inst.y_down - y_up;
				y_speed = max(y_speed, 0);
			}
		}
	}
	
	// Moving Down (Riding)
	var _lastRide = rideObject;
	rideObject = noone;
	
	var _inst = collision_rectangle(
		x + center_x, 
		y + y_down, 
		x + center_x, 
		y + y_down + 8, 
		ENTITY, false, true);
			
	if _inst && y_speed >= 0
	{
		if getBit(_inst.flag, Entity_Flag.bouncy)
		{
			if entityCollision(self, _inst)
			{
				y_speed = -2;
				y = _inst.y + _inst.y_up - y_down;
			}
		}
		else
		{
			if _inst.attackPower > 0 
			{
				if entityCollision(self, _inst) {addHealth(-_inst.attackPower);}
			}
		
			if getBit(_inst.flag, Entity_Flag.solid)
			{
				if y + y_down > _inst.y + _inst.y_up - 2
				{
					y = _inst.y + _inst.y_up - y_down + 1;
					y_speed = min(y_speed, 0); 
					clearFlag(Entity_Flag.inAir);
					rideObject = _inst;
				}
			}
		}
	}
	
	list_free(_list);
	
	// Just getting off object
	if _lastRide != noone
	&& _lastRide != rideObject
	{
		if instance_exists(_lastRide)
		{
			// Maintain Momentum
			x_speed += _lastRide.x_speed;
			y_speed += min(0, _lastRide.y_speed);
		}
	}
	
	#endregion
}

#endregion

#region Damage Player

if !getBit(FLAGS_GAMEPLAY, Gameplay_Flag.eventRunning)
{
	if !alarm[10]
	{
		var _list = list_create(), _inst, _hit = false,
		_l = instance_place_list(
			x, y, ENTITY, _list, false
			);
		
		for (var i = 0; i < _l; i++)
		{
			_inst = _list[| i];
			
			if _inst.attackPower > 0
			{
				if rectangle_in_rectangle(
					x + x_left, y + y_up,
					x + x_right, y + y_down,
					_inst.x + _inst.x_left, _inst.y + _inst.y_up,
					_inst.x + _inst.x_right, _inst.y + _inst.y_down
					)
				{
					addHealth(-_inst.attackPower);
					_hit = true;
					break;
				}
			}
		}
	
		list_free(_list);
		
		// Danger Tile
		//if !_hit
		{
			if isDangerTile( tile_collision_index_point(x + x_left, y + y_up) )
			|| isDangerTile( tile_collision_index_point(x + x_right, y + y_up) )
			|| isDangerTile( tile_collision_index_point(x + x_left, y + y_down) )
			|| isDangerTile( tile_collision_index_point(x + x_right, y + y_down) )
			{
				addHealth(-5);
				_hit = true;
			}
		}
	}
}

#endregion

#region Input

if !getGameplayFlag(Gameplay_Flag.noInput)
{
	// Menu
	if INPUT_MENU_PRESSED
	{
		if !getGameplayFlag(Gameplay_Flag.eventRunning)
		{
			if !instance_exists(obj_pauseScreen)
			{
				instance_create_depth(0, 0, 0, obj_pauseScreen);
				FREEZE = true; 
			}
		}
	}
	
	#region Left Right Movement
	
	// Not Moving / Both Left & Right
	if !(input_check(Input.left, Input.type_active, playerIndex)
	^^ input_check(Input.right, Input.type_active, playerIndex))
	{
		// Friction if grounded
		if !getFlag(Entity_Flag.inAir)
		{
			x_speed = approach(x_speed, 0, move_dec[state]);
		}
		
		if input_check(Input.down, Input.type_pressed, playerIndex)
		{
			playerFlag = playerFlag | 1 << Player_Flag.searching;
			search_buffer = SEARCH_BUFFER;
			if !getFlag(Entity_Flag.inAir) {setAnimation(Sequence_player.search);}
		}
	}
	// Move Left
	else if input_check(Input.left, Input.type_active, playerIndex) 
	{
		if !is_boosting
		{
			// Use Friction if grounded
			if !getFlag(Entity_Flag.inAir)
			{
				x_speed = approach(x_speed, -move_speed[state], move_acc[state]);
			}
			// Increase if less than max, ignore otherwise
			else if x_speed > -move_speed[state]
			{
				x_speed = approach(x_speed, -move_speed[state], air_acc[state]);
			}
		}
		
		_moving = true;
		
		setEntityDirection(Dir.left);
		playerFlag = playerFlag & ~(1 << Player_Flag.searching);
	}
	// Move Right
	else if input_check(Input.right, Input.type_active, playerIndex) 
	{
		if !is_boosting
		{
			// Use Friction if grounded
			if !getFlag(Entity_Flag.inAir)
			{
				x_speed = approach(x_speed, move_speed[state], move_acc[state]);
			}
			// Increase if less than max, ignore otherwise
			else if x_speed < move_speed[state]
			{
				x_speed = approach(x_speed, move_speed[state], air_acc[state]);
			}
		}
		
		_moving = true;
		
		setEntityDirection(Dir.right);
		playerFlag = playerFlag & ~(1 << Player_Flag.searching);
	}
	
	#endregion

	// Look Up
	flag = input_check(Input.up, Input.type_active, playerIndex)?
		flag | 1 << Entity_Flag.facingUp:
		flag & ~(1 << Entity_Flag.facingUp);
	
	// Search
	flag = input_check(Input.down, Input.type_active, playerIndex)?
		flag | 1 << Entity_Flag.facingDown:
		flag & ~(1 << Entity_Flag.facingDown);
	

	#region Left Right Look
	
	if input_check(Input.left, Input.type_pressed, playerIndex)
	{
		playerFlag = playerFlag & ~(1 << Player_Flag.searching);
	}

	if input_check(Input.right, Input.type_pressed, playerIndex)
	{
		playerFlag = playerFlag & ~(1 << Player_Flag.searching);
	}

	if input_check(Input.up, Input.type_pressed, playerIndex)
	|| input_check(Input.up, Input.type_released)
	{
		playerFlag = playerFlag & ~(1 << Player_Flag.searching);
	}
	
	#endregion
	
	#region Jump Controls
	
	if input_check(Input.z, Input.type_pressed, playerIndex) 
	{
		if !is_boosting
		{
			jump_buffer = JUMP_BUFFER;
		}
	}
	
	if getFlag(Entity_Flag.inAir) 
	{
		// Jump Mod
		jump_hold = jump_hold && input_check(Input.z, Input.type_active, playerIndex) && y_speed < 0;
	}
	else
	{
		// Jump
		if jump_buffer > 0
		{
			y_speed = -jump_height[state]; jump_hold = true;
			playerFlag = playerFlag & ~(1 << Player_Flag.searching);
			sfx_at(snd_jump, x, y, 0);
				
			jump_buffer = 0;
		}
	}
	
	if jump_buffer > 0 {jump_buffer--};
	
	#endregion
	
	// Reset Animation
	if input_check(Input.x, Input.type_pressed, playerIndex)
	{
		playerFlag = playerFlag & ~(1 << Player_Flag.searching);
	}

	#region Aim Direction Stuffs

	// Aim Up
	if flag & 1 << Entity_Flag.facingUp {direction = 90;}
	// In Air
	else if getFlag(Entity_Flag.inAir) 
	{
		// Aim Down
		if flag & 1 << Entity_Flag.facingDown {direction = 270;}
		else
		{
			// Aim In Direction
			if input_check(Input.aimLeft, Input.type_active, playerIndex) 
			{
				setEntityDirection(Dir.left);
			}
			if input_check(Input.aimRight, Input.type_active, playerIndex) 
			{
				setEntityDirection(Dir.right);
			}
		
			// Aim Right
			if entityDirection == Dir.right {direction = 0;}
			// Aim Left
			else {direction = 180;}
		}
	
	}
	// On Ground
	else 
	{
		// Aim Backwards
		if (flag & 1 << Entity_Flag.facingDown && x_speed != 0)
		|| (input_check(Input.aimLeft, Input.type_active, playerIndex) && entityDirection == Dir.right)
		|| (input_check(Input.aimRight, Input.type_active, playerIndex) && entityDirection == Dir.left)
		{
			// Aim Left
			if entityDirection == Dir.right {direction = 180;}
			// Aim Right
			else {direction = 0;}
			
			playerFlag = setBit(playerFlag, Player_Flag.lookingBack);
		}
		// Aim Forwards
		else
		{
			// Aim Right
			if entityDirection == Dir.right {direction = 0;}
			// Aim Left
			else {direction = 180;}
			
			playerFlag = clearBit(playerFlag, Player_Flag.lookingBack);
		}
	}
	
	#endregion

	#region Weapon Stuffs
	
	if weaponX != 0 {weaponX = approach(weaponX, 0, 3)}

	if ds_list_size(weaponList) > 0
	{
		if input_check(Input.next, Input.type_pressed, playerIndex) 
		{
			update_weapon_pre();
			weaponCurrent = loop(weaponCurrent + 1, 0, ds_list_size(weaponList)); 
			weaponX = -32; update_weapon();
			sfx(snd_switchWeapon);
		
		}

		if input_check(Input.prev, Input.type_pressed, playerIndex) 
		{
			update_weapon_pre();
			weaponCurrent = loop(weaponCurrent - 1, 0, ds_list_size(weaponList)); 
			weaponX = 32; update_weapon();
			sfx(snd_switchWeapon);
		}
	}
	
	#endregion

	#region Weapon Experience
	
	if ds_list_size(weaponList) > 0
	{
		if weaponList[| weaponCurrent] != Weapon.none
		{
			if place_meeting(x, y, obj_energy)
			{
				var _inst = instance_place(x, y, obj_energy), 
				_exp = _inst.experience, _gained = 0;
			
				_gained = weapon_addExperience(_exp);
			
				if _gained > 0
				{
					displayHeadNumber(_gained, Head_Number.type_energy, 
						center_x, y_up + Head_Number.y_off, 0, true);
			
					expBlink = 30;
					sfx_at(snd_expPickup, MY_X, MY_Y, 0);
					part_particles_create(PART_SYS_FRONT,
						_inst.x, _inst.y, getPartType(Part_Index.expSparkle), 10);
				
					with _inst
					{
						experience -= _gained;
						event_user(2);
					}
				}
			}

			expBlink -= expBlink > 1;

			if expBlink mod 4 <= 2 {expFlash = false;} else {expFlash = true;}
		}
	}
	
	#endregion
}
else
{
	// Friction if grounded
	if !getFlag(Entity_Flag.inAir)
	{
		x_speed = approach(x_speed, 0, move_dec[state]);
	}
}

#endregion

#region Animations

#region In Air

if getFlag(Entity_Flag.inAir)
{
	var _airSep = 1;
	// Rising
	if y_speed < -_airSep
	{
		if flag & 1 << Entity_Flag.facingUp {setAnimation(Sequence_player.rise_up)}
			else if flag & 1 << Entity_Flag.facingDown {setAnimation(Sequence_player.rise_down)}
			else {setAnimation(Sequence_player.rise)};
	}
	// Falling
	else if y_speed > _airSep
	{
		if flag & 1 << Entity_Flag.facingUp {setAnimation(Sequence_player.fall_up)}
			else if flag & 1 << Entity_Flag.facingDown {setAnimation(Sequence_player.fall_down)}
			else {setAnimation(Sequence_player.fall)};
	}
	// Middle
	else
	{
		if flag & 1 << Entity_Flag.facingUp {setAnimation(Sequence_player.air_up)}
			else if flag & 1 << Entity_Flag.facingDown {setAnimation(Sequence_player.air_down)}
			else {setAnimation(Sequence_player.air)};
	}
	
	playerFlag = clearBit(playerFlag, Player_Flag.searching);
}

#endregion

#region On Ground

else
{
	// Just Landing
	if getFlag(Entity_Flag.inAir) != _airLast 
	{
		if y_speed >= 0
		{
			if _lastYspeed >= 4
			{
				sfx_at(snd_thud, MY_X, MY_Y, 0);
				part_particles_create(PART_SYS_BACK, x + center_x, y + height,
					getPartType(Part_Index.smallDust), 4);
			}
					
			if !search_buffer
			{
				setAnimation(Sequence_player.idle);
			}
			else
			{
				setAnimation(Sequence_player.search);
				updateAnimation();
				setAnimationPosition(100);
			}
		}
	}
	
	if !(playerFlag & 1 << Player_Flag.searching)
	{
		// Idle
		if !_moving
		{
			if flag & 1 << Entity_Flag.facingUp 
			{
				setAnimation(Sequence_player.idle_up);
			}
			else 
			{
				// Aiming Backwards
				if getBit(playerFlag, Player_Flag.lookingBack)
				{
					setAnimation(Sequence_player.idle_back);
				}
				// Standing Still
				else
				{
					setAnimation(Sequence_player.idle);
				}
			};
		}
		// Running
		else
		{
			if getBit(flag, Entity_Flag.facingUp) 
			{
				setAnimation(Sequence_player.run_up);
			}
			else if getBit(flag, Entity_Flag.facingDown) 
			|| getBit(playerFlag, Player_Flag.lookingBack)
			{
				setAnimation(Sequence_player.run_back);
			}
			else {setAnimation(Sequence_player.run)};
			
			if animationNewFrameIs(1, 3)
			{
				sfx_at(get_snd_footStep(tileCurrent), x, y, 0);
			}
		}
	}
	else// if getAnimationIndex() != Sequence_player.search
	{
		setAnimation(Sequence_player.search);
	}
}

#endregion

#endregion


