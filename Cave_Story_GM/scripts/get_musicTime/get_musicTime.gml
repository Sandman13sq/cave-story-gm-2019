/// Returns milliseconds
/// @arg beats_per_minute,beats_per_bar,target_bar/repeat_bar,
function get_musicTime() {

	return (( 60 / argument[0] ) * argument[1] ) * (argument[2]);

	/*
	( (60 / bpm) * beats_per_bar ) * target_bar
	(  )

	wait = (60000 / tempo) / steps_per_beat

/* end get_musicTime */
}
