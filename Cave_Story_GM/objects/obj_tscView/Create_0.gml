/// @desc 
eventString = "No Event Being Performed";
eventStringRead = "";

depth = -100000;

x = 96;
y = 48;

if instance_exists(EVENT)
{
	eventString = EVENT.script_str;
	eventStringRead = string_copy(eventString, 1, EVENT.script_pos - 1);
}