/// @desc 

if FREEZE {exit}

if instance_exists(SOURCE)
{
	var _lastBoosting = SOURCE.is_boosting;
	
	if !getGameplayFlag(Gameplay_Flag.noInput)
	{
		SOURCE.is_boosting = false;

		if input_check(Input.down, Input.type_active, playerIndex) {initialDirection = Dir.down}
		else if input_check(Input.up, Input.type_active, playerIndex) {initialDirection = Dir.up}
		else if input_check(Input.left, Input.type_active, playerIndex) {initialDirection = Dir.left}
		else if input_check(Input.right, Input.type_active, playerIndex) {initialDirection = Dir.right}
		else {initialDirection = Dir.up}
		
		if boostLife
		{
			// Clear Jump Buffer
			global.inputBuffer_button = clearBit(global.inputBuffer_button, Input.z);
			
			if input_check(Input.action, Input.type_active, playerIndex) && canBoost
			{
				if getBit(SOURCE.flag, Entity_Flag.inAir)
				{
					// Nullify Gravity
					SOURCE.y_speed -= PLAYER_GRAVITY;
					SOURCE.is_boosting = true;
			
					if input_check(Input.action, Input.type_pressed, playerIndex)
					{
						SOURCE.x_speed = -boostSpeed * dcos(90 * initialDirection);
						SOURCE.y_speed = -boostSpeed * dsin(90 * initialDirection);
					}
			
					// Small Shift
					switch(initialDirection)
					{
						case(Dir.left):
							if input_check(Input.up, Input.type_active, playerIndex) {SOURCE.y_speed -= boostSpeedOther}
							if input_check(Input.down, Input.type_active, playerIndex) {SOURCE.y_speed += boostSpeedOther}
							if input_check(Input.right, Input.type_active, playerIndex) {SOURCE.x_speed += boostSpeedOther}
							break;
					
						case(Dir.right):
							if input_check(Input.up, Input.type_active, playerIndex) {SOURCE.y_speed -= boostSpeedOther}
							if input_check(Input.down, Input.type_active, playerIndex) {SOURCE.y_speed += boostSpeedOther}
							if input_check(Input.left, Input.type_active, playerIndex) {SOURCE.x_speed -= boostSpeedOther}
							break;
					
						case(Dir.up):
							if input_check(Input.left, Input.type_active, playerIndex) {SOURCE.x_speed -= boostSpeedOther}
							if input_check(Input.right, Input.type_active, playerIndex) {SOURCE.x_speed += boostSpeedOther}
							if input_check(Input.down, Input.type_active, playerIndex) {SOURCE.y_speed += boostSpeedOther}
							break;
					
						case(Dir.down):
							if input_check(Input.left, Input.type_active, playerIndex) {SOURCE.x_speed -= boostSpeedOther}
							if input_check(Input.right, Input.type_active, playerIndex) {SOURCE.x_speed += boostSpeedOther}
							if input_check(Input.up, Input.type_active, playerIndex) {SOURCE.y_speed -= boostSpeedOther}
							break;
				
					}
			
					boostLife--;
			
					if !alarm[0]
					{
						sfxCut(sfx_classic(Sound.booster));
						part_particles_create(PART_SYS_PLAYER, 
						PLAYER_X, PLAYER_Y, boostParticleType, 1);
						alarm[0] = 3;
					}
				}
				else
				{
					canBoost = false;
				}
			}
		}

		// Stop Boosting if touching ground
		if !getBit(SOURCE.flag, Entity_Flag.inAir)
		{
			canBoost = false; 
			boostLife = boostLifeMax; 
	
			if INPUT_JUMP_PRESSED 
			{jumpLock = true;}
		}
		else
		{
			if !jumpLock {canBoost = true;}
		}

		if INPUT_JUMP_RELEASED
		{
			jumpLock = false; 
		}
	}
	
	// Clamp X Speed when boosting stops
	with SOURCE
	{
		if is_boosting == false && _lastBoosting
		{
			if abs(x_speed) > move_speed[state]
			{
				x_speed = move_speed[state] * sign(x_speed);
			}
			
			var _lim = 4;
			
			if y_speed < -_lim
			{
				y_speed = -_lim;
			}
		};
	}
}