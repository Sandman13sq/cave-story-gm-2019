/// @desc 

// Inherit the parent event
event_inherited();

waitTimer = 0; // Time until trigger is active
// (Stops Trigger from being active right after a scene (Like exiting the Eggs in Egg Corridor))

var _in = 2;

axisX1 = x + _in;
axisY1 = y + _in;
axisX2 = x + UNIT_PX - _in;
axisY2 = y + UNIT_PX - _in;

visible = DEBUG;