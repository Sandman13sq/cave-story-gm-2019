/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

speed_theta = loop(speed_theta + 360 / period, 0, 360);

event_inherited();

switch(state)
{
	// Waiting For Player
	case(0):
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
		{
			// Look Range
			if collision_rectangle(
				MY_X - look_range,
				MY_Y - look_range,
				MY_X + look_range,
				MY_Y + look_range,
				PLAYER, false, true
				)
			{
				setAnimation(Sequence_critter.look);
				entityLookAtPlayer();
				
				// Jump Range
				if collision_rectangle(
					MY_X - jump_range,
					MY_Y - jump_range,
					MY_X + jump_range,
					MY_Y + jump_range,
					PLAYER, false, true
					)
				{
					// Squat
					setEntityState(2);
				}
			}
			else {setAnimation(Sequence_critter.idle);}
		}
		break;
		
	// Jump Squat
	case(2):
		if jump_step == 0
		{
			setEntityState(3);
		}
		else {jump_step--}
		break;
		
	// Jumping
	case(3):
		if !getFlag(Entity_Flag.inAir) && y_speed >= 0
		{
			setEntityState(0);
		}
		else
		{
			x_speed = polarize(entityDirection == Dir.right);
		}
		break;
}