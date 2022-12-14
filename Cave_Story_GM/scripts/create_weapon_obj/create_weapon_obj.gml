///
/// @arg object,
function create_weapon_obj(argument0) {

	var _src = self,
	_obj = instance_create_dependent(_src, argument0);

	with _obj
	{
		setAnimation(SOURCE.animationIndex);
	
		animationStep = SOURCE.animationStep;
		animationKeyframe = SOURCE.animationKeyframe;
	
		depth = SOURCE.depth + 2;
	
		event_perform(ev_step, ev_step_end);
		//updateAnimationFrame();
	
	
	}

	return _obj;


}
