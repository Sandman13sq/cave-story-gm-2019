/// @desc 

switch(loadState)
{
	case(0):
		if room != targetRoom
		{
			room_goto(targetRoom);
		}
		else {loadState = 1};
		break;
		
	// Load Room Data
	case(1):
		loadRoom_data();
		loadState = 2;
		break;
		
	case(2):
		break;
}