/// @desc 

var _debug = false;

with instance_create_depth(
	player_x * UNIT_PX, 
	player_y * UNIT_PX, 
	0,
	PLAYER
	)
{
	
}

// Set Default Camera Bounds
setCamera_bounds(
	0,
	0,
	room_width - CAMERA_W,
	room_height - CAMERA_H,
	);

// Update visible
with ENTITY 
{
	entityCheckEventFlag();
};
instance_create_depth(0, 0, 0, obj_entityInit);
updateHiddenEntity();

// Update Tiles and Layers
if _debug {msg("Tiles  and Layers");}
event_user(1);

// Collision
if _debug {msg("Collision");}
event_user(0);

// Camera
if _debug {msg("Camera Bounds");}
if instance_exists(obj_cameraBounds)
{
	var _inst = obj_cameraBounds;
	
	setCamera_bounds(
		_inst.bbox_left + (UNIT_PX / 2),
		_inst.bbox_top + (UNIT_PX / 2),
		_inst.bbox_right - CAMERA_W - (UNIT_PX / 2),
		_inst.bbox_bottom - CAMERA_H - (UNIT_PX / 2),
		);
	
	_inst.visible = false;
}
else
{
	calculateCameraBounds(COLLMAP);
}

setCamera_state(Camera_State.player);
setCamera_center(PLAYER_X, PLAYER_Y);

if _debug {msg("Run Event");}
runEvent(event);

clearBit((Mas.stage).flag, Stage_Flag.classic);
	
if _debug {msg("Done");}

instance_destroy();