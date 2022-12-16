/// @desc 

if FREEZE {exit}

// Inherit the parent event
event_inherited();

y = ystart + dsin(CURRENT_FRAME) * 2;

setAnimation(shakeTimer > 0? Sequence_chinfish.hurt: Sequence_chinfish.idle);
