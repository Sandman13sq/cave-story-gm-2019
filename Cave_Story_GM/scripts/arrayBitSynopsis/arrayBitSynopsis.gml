/// @desc Displays what Flags are set
/// @arg array
function arrayBitSynopsis(argument0) {

	var _str = "";
	for (var i = 0; i <= 9999; i++)
	{
		if get_arrayBit(argument0, i) {_str += "Flag ID: " + string(i) + "\n";}
	}

	msg(_str);


}
