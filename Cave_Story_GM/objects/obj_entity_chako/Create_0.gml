/// @desc 

// Inherit the parent event
event_inherited();

initAnimation(Animation_Group.chako);

enum Chako_State
{
	idle = 0,
	walking = 3,
	resting = 10,
	fixedDir = 11,
}

entityDirection = Dir.left;
snoreStep = 48;