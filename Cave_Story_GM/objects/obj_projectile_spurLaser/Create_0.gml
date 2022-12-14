/// @desc 

// Inherit the parent event
event_inherited();

lastDirection = direction;

lengthEnd = 0;
lengthStart = 0;
lengthSpeed = 10;

lengthTarget = UNIT_PX * 15;

laserLifeMax = 30;
laserLife = laserLifeMax;
radius = 10;

pulseTheta = 0;
pulseRadius = 0;
pulseColor = Col.bulletMid;

pierce = true;
stop = false;

color = c_white;
damage = 4;

hitCount = 1;

hitTimer = 0;

cutX = x;
cutY = y;
cutLength = 4;
cutStep = 0;