// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// is on mountain ?
// Example: [_position, _limit] execVM "WC_fnc_isonmountain.sqf";
// -----------------------------------------------

private [
	"_position",
	"_limit"
	];

	_position 	= _this select 0;
	_limit 		= _this select 1;

	if (isnil "_limit") then { _limit = 400;};

	_variance = [_position] call WC_fnc_getterraformvariance;
	
	if (_variance > _limit ) then {
		_result = true;
	} else {
		_result = false;
	};
	
	_result;