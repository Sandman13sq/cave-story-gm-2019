/// @desc Returns true if Gameplay Flag is set
/// @arg flag_index
function getGameplayFlag(argument0) {

	return FLAGS_GAMEPLAY & 1 << argument0;


}
