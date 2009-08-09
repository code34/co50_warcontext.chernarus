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
	"_object",
	"_list",
	"_result"
	];

	//_position	= _this select 0;
	//_radius		= _this select 1;

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
	
	_list = _position nearObjects _radius;
	
	_result = true;

	{
		if (_x isKindOf "House") then {_list = _list - [_x];};
	}foreach _list;
	
	if (count _list < 9 ) then { _result = false; };
	
	_result;