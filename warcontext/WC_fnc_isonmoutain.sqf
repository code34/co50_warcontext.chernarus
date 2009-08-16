// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// is on mountain ?
// Example: [_position, _limit] execVM "WC_fnc_isonmountain.sqf";
// -----------------------------------------------

private [
	"_indexparameters",
	"_nbparameters",
	"_parameters",
	"_position",
	"_limit"
	];

	//_position 	= _this select 0;
	//_limit 	= _this select 1;

	_parameters = [
		"_position",
		"_limit"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	if (isnil ("_limit")) then { _limit = 400;};

	_position = [_position] call WC_fnc_getterraformvariance;
	_position;