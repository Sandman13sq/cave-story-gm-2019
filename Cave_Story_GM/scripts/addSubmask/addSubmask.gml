/// @desc Adds to value of submask
/// @arg value,addition,pos,bits
function addSubmask(argument0, argument1, argument2, argument3) {

	var _value = argument0, _num;

	_num = (_value >> argument2) & ( power(2, argument3) - 1 ); // Get Value
	_value = _value & ~( ( power(2, argument3) - 1 ) << argument2 ); // Clear Field
	_value = _value | ( max(0, _num + argument1) << argument2 );

	return _value;


}
