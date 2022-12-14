/// @desc Sets value of submask
/// @arg value,submask,pos,bits
function setSubmask(argument0, argument1, argument2, argument3) {

	var _value = argument0;

	_value = _value & ~( ( power(2, argument3) - 1 ) << argument2 ); // Clear Field
	_value = _value | ( argument1 << argument2 ); // Add to Field


	return _value;


}
