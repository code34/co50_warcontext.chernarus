// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// is in forest ?
// Example: [_position, _radius] execVM "WC_fnc_isinforest.sqf";
// -----------------------------------------------

private [
	"_indexparameters",
	"_nbparameters",
	"_parameters",
	"_position",
	"_isflatempty",
	"_result"
	];

	_parameters = [
		"_position",
		"_radius"
	];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	if (isnil "_radius") then {_radius = 20;};
	
	_isflatempty = _position isflatempty [20, 0, 1, 20, 0, false]; 

	if (count _isflatempty > 0 ) then {
		_result = true;
	} else {
		_result = false;
	};
	_result;