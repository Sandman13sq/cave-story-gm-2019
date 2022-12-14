/// @desc 

// Inherit the parent event
event_inherited();

initAnimation(Animation_Group.player);

setAnimation(Sequence_player.idle);
setAnimationPallete(spl_quote, GAME.playerPaletteIndex);

teleporting = 0;
teleportX = 0;