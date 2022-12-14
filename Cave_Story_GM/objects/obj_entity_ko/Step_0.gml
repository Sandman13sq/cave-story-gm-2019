/// @desc 

if FREEZE {exit}; // Don't Run code if frozen

vspeed = min(5, vspeed);

if y + 64 > room_height
{
	instance_destroy();
}