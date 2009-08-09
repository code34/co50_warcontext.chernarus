// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// is in forest ?
// Example: [_object, _radius] execVM "WC_fnc_isinforest.sqf";
// -----------------------------------------------

private [
	"_object",
	"_list",
	"_result"
	];

	_object 	= _this select 0;
	_radius		= 20;

	_list = (getposasl _object) nearObjects _radius;
	
	if (count _list > 9 ) then {
		_result = true;
	} else {
		_result = false;
	};
	
	_result;