/// Returns milliseconds
/// @arg wait_time,steps_per_beat,beats_per_bar,target_bar/repeat_bar,
function get_musicTime_org() {

	var _bpm = 60000 / (argument[1] * argument[0]);

	return (( 60 / _bpm ) * argument[2] ) * argument[3];


	/*
	( (60 / bpm) * beats_per_bar ) * target_bar

	wait = (60000 / tempo) / steps_per_beat

	spb * wait = 60000 / tempo
	tempo * spb * wait = 60000
	tempo = 60000 / spb / wait

	beats_per_second = 60000 / (spb * wait * 60)

	Main
	137.78


/* end get_musicTime_org */
}
