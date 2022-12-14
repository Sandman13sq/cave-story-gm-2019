function updateCamera() {

	with CAMERA
	{
	#region Camera Behavior

		switch(state)
		{
			case(Camera_State.free):
				x = CAMERA_X; y = CAMERA_Y;
				break;
		
		#region Player

			case(Camera_State.player):
				if instance_exists(PLAYER)
				{
					//camera_set_view_pos(camera_current, 
					//	clamp(PLAYER.x - CAMERA_W / 2, 0, room_width - CAMERA_W),
					//	clamp(PLAYER.y - CAMERA_H / 2, 0, room_height - CAMERA_H));
					var _mod = 25, _xoffset = 96, _yoffset = 96, _x, _y;
			
					_y = PLAYER.y + 
					_yoffset * bool(INPUT_DOWN_HELD) * bool(getBit(PLAYER.flag, Entity_Flag.inAir)) - 
					_yoffset * bool(INPUT_UP_HELD);
					if INPUT_UP_HELD || INPUT_DOWN_HELD
					{_x = PLAYER.x + _xoffset * bool(INPUT_RIGHT_HELD) * -bool(INPUT_LEFT_HELD);}
					else
					//{_x = PLAYER.x + _xoffset * polarize(PLAYER.entityDirection == Dir.right);}
					{_x = PLAYER.x + _xoffset * polarize(PLAYER.direction == 0);}
			
					camera_x_dest = clamp(_x - CAMERA_W / 2, camera_x_min, camera_x_max);
					camera_y_dest = clamp(_y - CAMERA_H / 2, camera_y_min, camera_y_max);
			
					follow(0, 0, camera_x_dest, camera_y_dest, 0.2, 30, 6);
			
					CAMERA_X = x + camera_x_offset; 
					CAMERA_Y = y + camera_y_offset;
			
					//var _vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
					//camera_set_view_mat(camera_current, _vm);
				}
				break;
		#endregion
		
		#region Target
	
			case(Camera_State.target):
			
				if instance_exists(camera_target)
				{
					camera_x_dest = clamp(camera_target.x - CAMERA_W / 2, camera_x_min, camera_x_max);
					camera_y_dest = clamp(camera_target.y - CAMERA_H / 2, camera_y_min, camera_y_max);
			
					follow(0, 0, camera_x_dest, camera_y_dest, 0.1, 40, 6);
			
					CAMERA_X = x + camera_x_offset; 
					CAMERA_Y = y + camera_y_offset;
				}
				break;
		
			case(Camera_State.focus):
				var _inst = noone;
			
				with ENTITY
				{
					if event == other.camera_target
					{
						_inst = id;
					}
				}
			
				if instance_exists( _inst )
				{
					var _spd = camera_speed * 2;
				
					camera_x_dest = clamp(getCenterX(_inst) - CAMERA_W / 2, camera_x_min, camera_x_max);
					camera_y_dest = clamp(getCenterY(_inst) - CAMERA_H / 2, camera_y_min, camera_y_max);
			
					CAMERA_X = approach_grad(CAMERA_X, camera_x_dest, _spd) + camera_x_offset;
					CAMERA_Y = approach_grad(CAMERA_Y, camera_y_dest, _spd) + camera_y_offset;
			
					x = CAMERA_X;
					y = CAMERA_Y;
				}
				break;
		
		#endregion
		}

	#endregion

		camera_set_view_pos(camera_current, 
			CAMERA_X, 
			CAMERA_Y);

		audio_listener_position(CAMERA_X + CAMERA_W / 2, CAMERA_Y + CAMERA_H / 2, 0);
	}

	var _range = 96;

	with ENTITY
	{
		if in_range(x, CAMERA_X - _range, CAMERA_X + CAMERA_W + _range)
		&& in_range(y, CAMERA_Y - _range, CAMERA_Y + CAMERA_W + _range)
		{
			flag = setBit(flag, Entity_Flag.inCamera);
		}
		else
		{
			flag = clearBit(flag, Entity_Flag.inCamera);
		}
	}


}
