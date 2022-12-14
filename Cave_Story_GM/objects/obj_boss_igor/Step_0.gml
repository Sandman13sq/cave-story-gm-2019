/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Waiting
	case(Igor_State.idle):
		if timer <= 0
		{
			setEntityState(Igor_State.walk);
		}
		else {timer--;}
		break;
		
	// Walking
	case(Igor_State.walk):
		walkInDirection(2);
		
		var _s = 40;
		if collision_rectangle(
			MY_X + polarize(entityDirection == Dir.right) * _s, MY_Y,
			MY_X - polarize(entityDirection == Dir.right) * _s, y + y_down,
			PLAYER, false, true
			)
		{
			setEntityState(Igor_State.punch);
		}
		
		if timer <= 0
		{
			if attackState mod 2 == 1
			{
				setEntityState(Igor_State.jump);
			}
			else
			{
				setEntityState(Igor_State.idle);
			}
			attackState++;
		}
		else {timer--;}
		break;
		
	// Jump
	case(Igor_State.jump):
		walkInDirection(2);
		
		if getBit(collisionDirection, Dir.down) && !getFlag(Entity_Flag.inAir)
		{
			setEntityState(Igor_State.land);
		}
		break;
		
	// Landing
	case(Igor_State.land):
		if timer <= 0
		{
			// Charge
			if healthPoints < healthPointsMax / 2
			{
				setEntityState(Igor_State.charge);
			}
			else
			{
				setEntityState(Igor_State.idle);
			}
		}
		else {timer--;}
		break;
		
	// Charging
	case(Igor_State.charge):
		if timer <= 0
		{
			setEntityState(Igor_State.fire);
		}
		else 
		{
			if timer > 10
			{
				var _dist = 32,
					_x = MY_X + (entityDirection == Dir.right? 16: -16),
					_y = MY_Y - 8;
	
				effect_homingPower(
					_x + lengthdir_x(_dist + irandom(10), irandom(360)), 
					_y + lengthdir_y(_dist + irandom(10), irandom(360)), 
					_x, _y, 4, 1, 20, depth - 1, [c_white, c_missileBlue], [1, 0]
					);
			}
			timer--;
		}
		break;
		
	// Firing
	case(Igor_State.fire):
		if timer <= 0
		{
			setEntityState(Igor_State.idle);
			attackState = 0;
		}
		else 
		{
			if (timer mod 5) == 0
			{
				var _dist = 4, _dir = irandom_range(-15, 15),
					_sign = polarize(entityDirection == Dir.right),
					_x = MY_X + 16 * _sign,
					_y = MY_Y - 8;
					
				sfx_at( sfx_classic(Sound.blockExplosion), MY_X, MY_Y, 0, false);
					
				with instance_create_depth(_x, _y, depth - 1, obj_igorShot)
				{
					x_speed = _sign * lengthdir_x(_dist, _dir);
					y_speed = lengthdir_y(_dist, _dir);
				}
			}
			
			timer--;
		}
		break;
		
	// Attacking
	case(Igor_State.punch):
		if timer <= 0
		{
			setEntityState(Igor_State.idle);
		}
		else 
		{
			if animationNewFrameIs(1)
			{
				var _list = list_create(), _s = 40,
				_l = collision_rectangle_list(
					MY_X + polarize(entityDirection == Dir.right) * _s, MY_Y,
					MY_X - polarize(entityDirection == Dir.right) * _s, y + y_down,
					PLAYER, false, true, _list, false
					);
					
				for (var i = 0; i < _l; i++)
				{
					with _list[| i]
					{
						addHealth(-5);
					}
				}
				
				list_free(_list);
			}
			timer--;
		}
		break;
}