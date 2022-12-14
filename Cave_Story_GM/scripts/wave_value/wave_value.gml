/// @desc Returns value based on trig and current time
/// @arg from,to,duration,offset
function wave_value(argument0, argument1, argument2, argument3) {

	// From Shaun Spalding's video "5 Useful Scripts for GameMaker Studio 2 (and 1!)"

	var _a4 = (argument1 - argument0) / 2;

	return argument0 + _a4 + sin(((( current_time + 0.001) + argument2 * argument3) / argument2) * (pi * 2) ) * _a4;


}
