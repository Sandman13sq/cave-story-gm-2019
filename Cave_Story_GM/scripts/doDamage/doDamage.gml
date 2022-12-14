/// @desc Deals damage to entity
/// @arg damage
function doDamage(argument0) {

	healthChange = -argument0;

	event_user(2);

	flag = flag | 1 << Entity_Flag.damageTaken;


}
