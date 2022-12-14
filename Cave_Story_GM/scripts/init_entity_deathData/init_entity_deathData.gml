/// @desc Sets death information
/// @arg hurtSound,hurtParticle,deathSound,deathCloud
function init_entity_deathData(argument0, argument1, argument2, argument3) {

	deathData = 0;
		deathData = deathData | argument0;
		deathData = deathData | argument1 << 16;
		deathData = deathData | argument2 << 32;
		deathData = deathData | argument3 << 48;


}
