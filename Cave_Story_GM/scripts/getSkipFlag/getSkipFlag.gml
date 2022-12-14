/// @desc Returns true if Skip Flag is set
/// @arg flag_index
function getSkipFlag(argument0) {

	return FLAGS_SKIP & 1 << argument0;


}
