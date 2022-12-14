/// @desc 

//get_classic_backgroundMode()
x = 0;
y = 0;

depth = 100000;

enum Background_Mode
{
	fixed = 0,
	parallax = 1,
	foreground = 2,
	hide = 3,
	hide2 = 4,
	scrollLeft = 5,
	scroll_gravity = 6,
	scroll = 7,
	hide3 = 8,
	
	scroll_inv,
}

bkIndex = 0;
bkSprite = spr_null;
bkColor_top = -1;
bkColor_bottom = -1;
bkMode = Background_Mode.fixed;
bkSpeed = 8;
bkVal = false;
bkStep = 0;

otherX = 0;
otherY = 0;
otherS = 72;