/// @desc 

if life == 0
{
	instance_destroy();
}
else
{
	if life mod 4 == 0 {flash = !flash}
	life--;
}

y -= 1;