/// @desc 

if FREEZE {exit}

switch(state)
{
	// Bubble
	case(0):
		move();
		
		x_speed -= 0.05;
		break;
}

bubble = !bubble;