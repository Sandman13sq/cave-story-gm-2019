/// @desc Update Sprite on State Change

// Inherit the parent event
event_inherited();

weaponIndex = state;

/*

var _data = WEAPONDATALIST[| weaponIndex];

weaponSprite = _data[1, 5];