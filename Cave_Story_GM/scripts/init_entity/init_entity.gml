/// @desc Initializes general entity variables
/// @arg width,height,center_x,center_y,flag,*depth
function init_entity() {

	image_speed = 0;

	lastColl = 0;
	width = argument[0];
	height = argument[1];

	x_left = bbox_left - x;
	x_right = bbox_right - x;
	y_up = bbox_top - y;
	y_down = bbox_bottom - y;

	center_x = argument[2];
	center_y = argument[3];

	ID = 0;
	event = -1;
	type = object_index;
	flag = argument[4];
	targetDepth = argument_count > 5? argument[5]: LyrDepth.midEntities;
	state = 0;

	x_speed = 0;
	y_speed = 0;

	setFlag(Entity_Flag.inAir);
	setFlag(Entity_Flag.inCamera);

	move_speed = 0;
	move_acc = 0;
	collisionDirection = 0;

	y_acc_max = 0;
	y_acc = 0;
	jump_hold = false;

	sprite_offset_x = 0;
	sprite_offset_y = 0;
	image_xflip = -1;

	healthPoints = -1;
	healthPointsMax = 0;
	attackPower = 0;
	experience = 0;

	deathData = 0;

	setEntityDirection(Dir.left);

	healthChange = 0;
	healthChangeHold = 0;
	healthChangeObj = -1;

	shakeTimer = 0;

	color = c_white;


}
