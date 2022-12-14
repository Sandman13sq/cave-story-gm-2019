/// @desc Initializes Variables to use with methods
function initMethod() {

#region enum Method

	enum Method
	{
		null = -1,
	
		cameraChange = 0,
	}

#endregion

	global.MethodFunction = -1;
#macro MT_FUNCTION global.MethodFunction

	global.MethodData = [];
#macro MT_DATA global.MethodData

	global.MethodReturn = NaN;
#macro MT_RETURN global.MethodReturn

#macro MT_EVENTUSER 15


}
