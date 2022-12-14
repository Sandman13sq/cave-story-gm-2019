/// @desc 

FLAGS_GAMEPLAY = clearBit(FLAGS_GAMEPLAY, Gameplay_Flag.stayFrozen);
FREEZE = false;

setGameplayFlag(Gameplay_Flag.showGUI);

runEventLine("<END");

with PLAYER
{
	weaponCurrent = getPlayerData(Player_Stat.current_weapon);
	update_weapon(false);
}

/*
input_halt(Input.z, 2);
input_halt(Input.x, 2);