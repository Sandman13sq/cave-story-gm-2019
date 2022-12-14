/// @desc Animate Water

if FREEZE {exit}; // Don't Run code if frozen

y = obj_waterLevel.y;
waterY1 = obj_waterLevel.y;
waterY2 = room_height;

waterLineX = loop(waterLineX + 0.25, 0, 3200);

waterLineXDraw = loop(CAMERA_X + waterLineX, 0, 32);