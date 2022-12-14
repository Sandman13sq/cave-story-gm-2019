/// @desc 

fullHeight = sprite_height * image_number;

if input_check(Input.up, Input.type_active) {y--;}
if input_check(Input.down, Input.type_active) {y++;}
if input_check(Input.right, Input.type_active) {x++;}
if input_check(Input.left, Input.type_active) {x--;}