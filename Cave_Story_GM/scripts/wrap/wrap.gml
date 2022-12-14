/// Credits to pushcx (Reddit)
function wrap(argument0, argument1, argument2) {

	/// @description loop(value, min, max)
	/// @function wrap
	/// @param value The value to wrap into the bounds
	/// @param min Minimum bound, inclusive
	/// @param max Maximum bound, inclusive
	// Returns the value wrapped to the range [min, max] (min and max can be swapped).
	// Calls floor() on reals, but GML's modulo is doing something weird and original_wrap just hangs indefinitely on some values anyways so oh well.

	var value = floor(argument0);
	var _min = floor(min(argument1, argument2));
	var _max = floor(max(argument1, argument2));
	var range = _max - _min + 1; // + 1 is because max bound is inclusive

	return (((value - _min) % range) + range) % range + _min;

	/*
	/// @description loop(value,min,max)
	/// @param value
	/// @param min
	/// @param max
	//returns the value wrapped.  If it is above or below the threshold it will wrap around

	var _val=argument[0];
	var _max = argument[2];
	var _min = argument[1];

	if(_val mod 1 == 0)
	{
	    while(_val > _max || _val < _min)
	    {
	        if(_val > _max)
	        {
	            _val=_min + _val - _max - 1
	        }
	        else if (_val < _min)
	        {
	            _val=_max + _val - _min + 1;
	        }
	        else
	            _val=_val;
	    }
	    return(_val);
	}
	else
	{
	    var _old = argument[0]+1;
	    while(_val != _old)
	    {
	        _old=_val;
	        if(_val<_min)
	            _val=_max-(_min-_val);
	        else if(_val >_max)
	            _val=_min+(_val-_max);
	        else
	            _val=_val;
	    }
	    return(_val)
	}


/* end wrap */
}
