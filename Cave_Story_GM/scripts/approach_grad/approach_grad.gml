/// @desc Returns value incremented or decremented towards a target value
/// @arg value,target_value,mod
function approach_grad() {

	if argument[0] < argument[1]
	{
	    return min(argument[0] + (argument[1] - argument[0]) / argument[2], argument[1]); 
	} 
	else 
	{
	    return max(argument[0] + (argument[1] - argument[0]) / argument[2], argument[1]);
	}


}
