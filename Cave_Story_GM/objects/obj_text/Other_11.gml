/// @desc Update Position

switch(anchor)
{
	default:
		x = (CAMERA_W - Text.box_w) / 2;
		y = CAMERA_H - Text.box_h - 12;
		break;
		
	case(1):
		x = (CAMERA_W - Text.box_w) / 2;
		y = 12;
		break;
}