/// @desc 

// Inherit the parent event
event_inherited();

initAnimation(Animation_Group.player);

setAnimationPallete(spl_quote, GAME.playerPaletteIndex);

teleporting = 0;
teleportX = 0;
timer = 0;

setEntityState(0);