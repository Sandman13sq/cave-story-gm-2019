/// @desc 

if FREEZE {exit;}

// Inherit the parent event
event_inherited();

targetDepth = LyrDepth.backEntities;
depth = LyrDepth.backEntities;

var _beamWidth = 32, _xoff = (_beamWidth / 2);

beamX1 = x + _xoff + (_beamWidth * dsin(beamTheta) / 2);
beamX2 = x + _xoff + (_beamWidth * dsin(beamTheta + 30) / 2);

beamTheta = loop(beamTheta + beamSpeed, 0, 360);