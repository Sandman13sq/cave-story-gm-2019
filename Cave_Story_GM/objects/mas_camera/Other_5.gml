/// @desc Clear Activation Lists

camera_destroy(camera_current);

ds_list_clear(activationList);
ds_list_clear(deactivatedList);