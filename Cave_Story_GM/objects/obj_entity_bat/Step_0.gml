/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

speed_theta = loop(speed_theta + 360 / period, 0, 360);

run_flags();

y = round(ystart + dcos(speed_theta) * amplitude);
entityLookAtPlayer();