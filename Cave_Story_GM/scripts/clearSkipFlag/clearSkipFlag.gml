/// @desc Clears Skip Flag
/// @arg flag_index
function clearSkipFlag(argument0) {

	FLAGS_SKIP = FLAGS_SKIP & ~(1 << argument0);


}
