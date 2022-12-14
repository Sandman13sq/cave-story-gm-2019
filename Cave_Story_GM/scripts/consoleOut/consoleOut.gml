/// @desc Sends text to console
/// @arg string,*color,*time,
function consoleOut() {

	with Mas.console
	{
		ds_list_insert(consoleString, 0, argument[0]);
		ds_list_insert(consoleColor, 0, argument_count > 1? argument[1]: c_white);
		ds_list_insert(consoleTimer, 0, argument_count > 2? argument[2]: timeToFrames(0, 5));
	}


}
