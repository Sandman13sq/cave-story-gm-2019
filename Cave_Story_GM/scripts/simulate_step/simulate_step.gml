/// @desc Simulate step event for all objects
/// @arg frames
function simulate_step(argument0) {

	if !STEPSIM
	{
		STEPSIM = true;
	
		draw_enable_drawevent(false);
	
		var _l = instance_number(ENTITY);
	
		repeat(argument0)
		{
			for (var i = 0; i < _l; i++)
			{
				with instance_find(ENTITY, i)
				{
					event_perform(ev_step, ev_step_begin);
					event_perform(ev_step, ev_step_normal);
					event_perform(ev_step, ev_step_end);
				}
			}
		
			with mas_camera
			{
				event_perform(ev_step, ev_step_begin);
				event_perform(ev_step, ev_step_normal);
				event_perform(ev_step, ev_step_end);
			}
		}
	
		draw_enable_drawevent(true);
	
		STEPSIM = false;
	}


}
