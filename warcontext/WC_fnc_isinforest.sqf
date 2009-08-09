// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// is in forest ?
// Example: [_position, _radius] execVM "WC_fnc_isinforest.sqf";
// -----------------------------------------------

private [
	"_object",
	"_list",
	"_result"
	];

	_position	= _this select 0;
	_radius		= _this select 1;
	if (isnil "_radius") then {_radius = 20;};
	
	_list = _position nearObjects _radius;
	
	if (count _list > 9 ) then {
		_result = true;
	} else {
		_result = false;
	};
	
	_result;