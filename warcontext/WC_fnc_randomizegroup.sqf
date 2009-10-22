// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
if (!isServer) exitWith{};

	private [
		"_indexparameters",
		"_nbparameters",
		"_parameters",
		"_marker",
		"_markername",
		"_position",
		"_markersize",
		"_randomvehicle",
		"_randomunit",
		"_randomunitoccupation",
		"_randomvehicleoccupation",
		"_listofunit",
		"_listofvehicle",
		"_listglobal",
		"_index",
		"_unit",
		"_togarbage"
	];

	_parameters = [
		"_markername",
		"_togarbage"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	_position	= getmarkerpos _markername;
	_markersize	= getmarkersize _markername select 0;

	_markername	= format["%1ups", _markername];
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_randomvehicle = [
		"bmp",
		"shilka",
		"t72",
		"t90",
		"tunguska",
		"mi17",
		"mi24",
		"uralrepair",
		"uralreammo",
		"uralrefuel"
	];

	_randomunit = [
		"army1",
		"special1",
		"special2"
	];

	_randomunitoccupation 		= random wcmaxenemyunit;
	_randomvehicleoccupation 	= random wcmaxenemyvehicle;
	_listofunit = [];
	_listofvehicle = [];

	while {(count _listofunit < _randomunitoccupation)} do {
		_index = 0;
		_index = floor random (count _randomunit);
		_unit = _randomunit select _index;
		_listofunit = _listofunit + [_unit];
		sleep 0.1;
	};

	while {(count _listofvehicle < _randomvehicleoccupation)} do {
		_index = 0;
		_index = floor random (count _randomvehicle);
		_vehicle = _randomvehicle select _index;
		_listofvehicle = _listofvehicle + [_vehicle];
		sleep 0.1;
	};

	_listglobal = _listofvehicle + _listofunit;

	{
		if (isnil "_togarbage") then {
			call compile format ["nil = ['%1','%2'] spawn WC_fnc_creategroup;", _markername, _x];
		} else {
			call compile format ["nil = ['%1','%2', %3] spawn WC_fnc_creategroup;", _markername, _x, _togarbage];
		};
	}foreach _listglobal;

	true;