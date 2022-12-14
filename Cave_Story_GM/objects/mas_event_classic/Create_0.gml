/// @desc Init

depth = LyrDepth.foreground;

event = -1;
eventMap = -1;

script_str = "";
script_pos = 1;
script_lastPos = 1;

script_mode = Script_Mode.cmd;
script_hold = -1;
lastCommand = "";

ammoHold = 0;
weaponHold = 0;

enum Script_Mode
{
	cmd,
	nod,
	pause,
	waitTillStanding,
	text,
	wait,
	fade,
	yesNo,
	
	profile,
}

is_running = false;
clear_text();

FLAGS_GAMEPLAY = setBit(FLAGS_GAMEPLAY, Gameplay_Flag.eventRunning);

faceIndex = 0;

//runEvent()