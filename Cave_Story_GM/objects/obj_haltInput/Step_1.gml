/// @desc 

if timer > 0
{
	timer--;
}
else
{
	global.inputFlag_locked = clearBit(global.inputFlag, inputIndex);
	
	instance_destroy();
}