/// @desc Displays what Flags are set
function eventFlagSynopsis() {

	var _str = "";
	for (var i = 0; i <= 9999; i++)
	{
		if getEventFlag(i) {_str += "Flag ID: " + string(i) + "\n";}
	}

	msg(_str);


}
