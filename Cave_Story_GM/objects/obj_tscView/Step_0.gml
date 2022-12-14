/// @desc 

if keyboard_check_direct(ord("I")) {y--};
if keyboard_check_direct(ord("K")) {y++};

if instance_exists(EVENT)
{
	eventString = EVENT.script_str;
	eventStringRead = string_copy(eventString, 1, EVENT.script_pos - 1);
}
else
{
	eventString = "No Event Being Performed";
	eventStringRead = "";
}