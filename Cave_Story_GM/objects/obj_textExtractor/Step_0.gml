/// @desc 
var _spd = 4;

if input_check(Input.up, Input.type_active) {y -= _spd;}
if input_check(Input.down, Input.type_active) {y += _spd;}
if input_check(Input.right, Input.type_active) {x += _spd;}
if input_check(Input.left, Input.type_active) {x -= _spd;}