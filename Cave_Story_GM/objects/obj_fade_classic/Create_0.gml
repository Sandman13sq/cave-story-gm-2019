/// @desc 
depth = LyrDepth.background; // Draws below text and stuff

fadeSurf = -1;
fadeStep = 0;
fadeStepMax = 48;
fadeIn = false;

fadeMode = 0;
fadeSpeed = 5;

fadeCellMaxX = ceil(CAMERA_W div sprite_width) + 1;
fadeCellMaxY = ceil(CAMERA_H div sprite_height) + 1;

subimageMax = image_number - 1;