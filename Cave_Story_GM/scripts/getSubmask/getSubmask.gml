/// @desc Returns submask of value
/// @arg value,pos,bits
function getSubmask(argument0, argument1, argument2) {

	return (argument0 >> argument1) & ( power(2, argument2) - 1 );


}
