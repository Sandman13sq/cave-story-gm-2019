/// @desc Update Player Data

setPlayerData(Player_Stat.life, healthPoints);
setPlayerData(Player_Stat.lifeMax, healthPointsMax);

setPlayerData(Player_Stat.current_weapon, weaponCurrent);

playerFlag = clearBit(playerFlag, Player_Flag.searching);

if entityDirection == Dir.right
{
	setFlag(Entity_Flag.facingRight);
}
else
{
	clearFlag(Entity_Flag.facingRight);
}

GAME.playerFlag = [flag, playerFlag];

update_weapon_pre();