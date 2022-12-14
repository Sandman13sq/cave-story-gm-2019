/// @desc 

if FREEZE {exit}; // Don't Run code if frozen

y = ystart + (waterAmplitude * dsin(waterTheta) );
waterTheta = loop(waterTheta + waterThetaSpeed, 0, 360);

waterDrawH = (y - CAMERA_Y - CAMERA_H / 2) / 3;
waterX = loop(waterX + 0.5, 0, 0x100);

underWater = waterDrawH > 0;

event_user(1);