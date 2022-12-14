/// @desc Clears Gameplay Flag
/// @arg flag_index
function clearGameplayFlag(argument0) {

	FLAGS_GAMEPLAY = FLAGS_GAMEPLAY & ~(1 << argument0);


}
