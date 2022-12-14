/// @desc 
waterSurface = -1;
waterDrawH = 0;
waterX = 0;

waterSurfaceW = 128;
waterSurfaceH = 64;

depth = LyrDepth.backwater;

underWater = false;

frontInst = instance_create_depth(x, y, 0, obj_waterLevelFront);

waterTheta = 0;
waterThetaSpeed = 1;
waterAmplitude = 32;

event_user(1);