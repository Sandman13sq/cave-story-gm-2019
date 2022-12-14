/// @desc 

event_inherited();

if getBit(FLAGS_GM, GM_Flag.startWith_airtank)
{
	setEquipFlag(Equip_Flag.airTank);
}

playerIndex = 0;

init_entity(32, 32, 16, 16, 
	setBit(flag, Entity_Flag.noDeactivate),
	LyrDepth.player);
	
init_entity_deathData(snd_playerHurt, 0, 0, 0);
initAnimation(Animation_Group.player);

init_entity_dimensions(6, 2, 26, 32);

setAnimation(Sequence_player.idle);

if getPlayerData(Player_Stat.life) <= 0
{
	setPlayerData(Player_Stat.life, getPlayerData(Player_Stat.lifeMax));
}

healthPoints = getPlayerData(Player_Stat.life);
healthPointsMax = getPlayerData(Player_Stat.lifeMax);

jump_hold = false;
jump_buffer = 0;
search_buffer = 0;
is_boosting = false;

rideObject = noone;
energyChangeObj = noone;
interactObj = noone;
airMeterObj = noone;
weaponObj = noone;

guiAlpha = 1;

searchList = list_create();

setPlayerPhysics(0, 
	4, 3, 0.2, 0.2, 0.14,
	PLAYER_GRAVITY, PLAYER_GRAVITY_MAX, 0.09);

/*

// TRUE Physics

setPlayerPhysics(0, 
	pixToDec(0x500), pixToDec(0x32C), 
	pixToDec(0x55), pixToDec(0x33), pixToDec(0x20), 
	PLAYER_GRAVITY, PLAYER_GRAVITY_MAX, pixToDec(0x20));
*/
	
setPlayerPhysics(1, 
	2, 1.5, 0.15, 0.1, 0.1, 
	PLAYER_GRAVITY / 2, PLAYER_GRAVITY_MAX / 2, 0.04);

#region Hud

enum Hud
{
	bar_x = 32, bar_y1 = 64, bar_y2 = 86,
	bar_h = 20,
	
	bar_value_x = Hud.bar_x + 48,
	bar_value_h = 16, bar_value_w = 80,
	
	weapon_x = 32, weapon_y = 32, weapon_w = 32,
	ammo_x = 64,
	
	gaugeNum_x = Hud.bar_x + 4, 
	gaugeNum_y1 = Hud.bar_y1 + 2, 
	gaugeNum_y2 = Hud.bar_y2 + 2, 
}

#endregion

#region Player_Flag

// Player Flags
enum Player_Flag
{
	searching,
	event,
	lockInput,
	showGUI,
	lookingBack,
}

#endregion

// Grab Flags Stored
flag = flag | GAME.playerFlag[0];
playerFlag = GAME.playerFlag[1];

cout( getFlag(Entity_Flag.facingRight) );

setEntityDirection( getFlag(Entity_Flag.facingRight)? Dir.right: Dir.left );

tileCurrent = 0;

#region Weapons & Equip

weaponList = getPlayerData(Player_Stat.weapons);
weaponCurrent = getPlayerData(Player_Stat.current_weapon); // Current List Index
weaponMeta = -1;
weaponData = -1; // Current Weapon Data
weaponSprite = -1;
weaponX = 32; // GUI Weapon X position

event_user(1);

updateEquip();

#endregion

expBlink = 1;
expFlash = false;

FLAGS_GAMEPLAY = setBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists);