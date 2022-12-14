/// @desc 

depth = LyrDepth.maxFront + 10;

alpha = 0;
alphaSpeed = 0.01;
state = 0;

timer = 0;
playCount = 0;
volume = VOLUME_SFX;

bgm(Music.null);
setCamera_target(self, 20);

alarm[0] = 120;

image_speed = 0;