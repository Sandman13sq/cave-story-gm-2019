/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_sym.terminalOff);
		break;
		
	case(1):
		sfx_at(snd_computerBeep, MY_X, MY_Y, 0);
		if getBit(flag, Entity_Flag.option2)
		{
			setAnimation(Sequence_sym.terminalRed);
		}
		else
		{
			setAnimation(Sequence_sym.terminalOn);
		}
		break;
}