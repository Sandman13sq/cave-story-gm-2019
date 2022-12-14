/// @desc Flicker when hit

if alarm[10]
{
	alarm[3] = 4;
	flag = flag & 1 << Entity_Flag.hide?
		flag & ~(1 << Entity_Flag.hide):
		flag | 1 << Entity_Flag.hide;
}
else {flag = flag & ~(1 << Entity_Flag.hide)}