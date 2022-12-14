/// @desc 

switch(bkMode)
{
	case(Background_Mode.scroll):
		x = CAMERA_X // + CAM_WIDTH_OFFSET;
		y = CAMERA_Y;
		
		bkStep = (bkStep + bkSpeed) mod (sprite_get_width(bkSprite) * 16);
		break;
		
	case(Background_Mode.scrollLeft):
	case(Background_Mode.scroll_gravity):
		x = CAMERA_X// + CAM_WIDTH_OFFSET;
		y = CAMERA_Y;
		
		bkStep = (bkStep + bkSpeed) mod (sprite_get_width(bkSprite) * 16);
		break;
		
	case(Background_Mode.scroll_inv):
		x = CAMERA_X// + CAM_WIDTH_OFFSET;
		y = CAMERA_Y;
		
		bkStep = (bkStep + bkSpeed) mod (sprite_get_width(bkSprite) * 16);
		break;
}
/*
if keyboard_check(vk_left) {otherX--}
if keyboard_check(vk_right) {otherX++}
if keyboard_check(vk_up) {otherY--}
if keyboard_check(vk_down) {otherY++}

if keyboard_check(vk_enter) {window_set_fullscreen(!window_get_fullscreen())}