/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		var _range = 128;
		if collision_rectangle(x - _range, y - _range, x, y + _range, PLAYER, false, true)
		{
			setEntityState(1);
			setAnimation(Sequence_door.eyeOpen);
		}
		break;
		
	case(1):
		var _range = 128;
		if animationIsOver() && !alarm[1] {setAnimation(Sequence_door.eyeBlink)}
		if !collision_rectangle(x - _range, y - _range, x, y + _range, PLAYER, false, true)
		{
			setEntityState(0);
			setAnimation(Sequence_door.eyeClose);
		}
		break;
}

run_flags();