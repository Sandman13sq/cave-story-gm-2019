/// @desc Drops entity experience
function dropExp() {

	var _experience = experience;

	_experience = dropExp_createExp(20, _experience, 100);
	_experience = dropExp_createExp(16, _experience, 10);
	_experience = dropExp_createExp(10, _experience, 5);
	_experience = dropExp_createExp(8, _experience, 1);



}
