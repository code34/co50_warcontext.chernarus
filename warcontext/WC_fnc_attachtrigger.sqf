// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description:
// Attach a trigger to an object
// -----------------------------------------------

private [
	"_indexparameters",
	"_nbparameters",
	"_parameters",
	"_object",
	"_trigger",
	"_refrestime"
	];

	_parameters = [
		"_object",
		"_trigger",
		"_refreshtime"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	if (isnil ("_refreshtime")) then { _refreshtime = 4; };

	while {alive _object} do {
		_trigger setpos (position _object);
		sleep _refreshtime;
	};