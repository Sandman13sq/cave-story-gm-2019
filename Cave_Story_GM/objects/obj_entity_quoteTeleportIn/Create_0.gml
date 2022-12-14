/// @desc 

// Inherit the parent event
event_inherited();

initAnimation(Animation_Group.player);

setAnimationPallete(spl_quote, GAME.playerPaletteIndex);

teleporting = 32;
teleportX = 0;
timer = 0;

setEntityState(0);

sfx_at(snd_teleport, MY_X, MY_Y, 0);