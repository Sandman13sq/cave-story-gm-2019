/// @desc 

depth = 1000;

state = 0;
push = 0;
y_offset = 0;
y_offset_target = 0;
push = 0;

select = array_create(4);
selectOffset = 0;

text_color = obj_intro.text_color;
sliceSprite = spr_betaSlice;
faceSprite = getFaceSprite();

selectString[2] = ["Load", "Delete"];
selectString[3] = ["Yes", "No"];

newData = array_create(16);
newDataChoice = [
	"Profile Name",
	"File Name",
	"Prev Face",
	"Next Face",
	"Save Profile",
	"Back",
	];

profileSelect = 0;

editString = "";
canSave = true;
backSpaceCheck = false;

event_user(0);

x = (CAMERA_W - Profile_GUI.w) / 2;
y = 40 + y_offset_target;