/// @desc Returns value incremented or decremented towards a target value
/// @arg value,target_value,step
function approach() {

	if (argument[0] < argument[1]) 
	{
	    return min(argument[0] + argument[2], argument[1]); 
	} 
	else 
	{
	    return max(argument[0] - argument[2], argument[1]);
	}


}
