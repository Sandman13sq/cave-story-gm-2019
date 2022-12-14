/// @desc 

// Inherit the parent event
event_inherited();

if FREEZE {exit;}

if !irandom(8) {drawHolo = !drawHolo}

weaponY = wave_value(-8, 0, 2000, 0);

/*
if timer == 60
{
	timer = 0;
	setEntityState(loop(state + 1, 0, sprite_get_number(spr_weapon) - 1));
}
else {timer++;}