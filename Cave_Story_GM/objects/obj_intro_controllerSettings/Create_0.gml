/// @desc 

x = CAMERA_W / 2;
y = 96;

showGpad = false;

inputSelect = 0;
preSelect = 0;
selectOffset = 0;
inPre = true;
state = 0;

beta = obj_intro.beta;

preStr = ["Back", "Test Input"];
inputSelectStart = array_length(preStr);

var _sep = " --- ";

menuStr[Input.left] = "Left" + _sep;
menuStr[Input.up] = "Up" + _sep;
menuStr[Input.right] = "Right" + _sep;
menuStr[Input.down] = "Down" + _sep;

menuStr[Input.action] = "Jump / Confirm" + _sep;
menuStr[Input.cancel] = "Shoot / Back" + _sep;
menuStr[Input.menu] = "Menu" + _sep;
menuStr[Input.select] = "Map" + _sep;

menuStr[Input.prev] = "Prev Weapon" + _sep;
menuStr[Input.next] = "Next Weapon" + _sep;
menuStr[Input.aimLeft] = "Aim Left" + _sep;
menuStr[Input.aimRight] = "Aim Right" + _sep;

menuMax = array_length(menuStr);
selectMax = inputSelectStart + menuMax;

activeInput = -1;
lastInput = -1;
inputDevice = (global.InputObj).inputDevice;

event_user(0);