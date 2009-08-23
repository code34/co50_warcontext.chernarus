// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
if (!isServer) exitWith{};

	private [
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
		"_unit"
	];

	_markername	= _this select 0;
	_position	= getmarkerpos _markername;
	_markersize	= getmarkersize _markername;

	call compile format["%1ups = createMarker[""%1ups"", %2];",_markername, _position];
	call compile format ["""%1ups"" setMarkerSize %2;",_markername, _markersize];

	_randomvehicle = [
		"bmp",
		"shilka",
		"t72",
		"t90",
		"tunguska"
	];

	_randomunit = [
		"army1",
		"special1",
		"special2"
	];

	_randomunitoccupation 		= random wcmaxenemyunit * random wclevel ;
	_randomvehicleoccupation 	= random wcmaxenemyvehicle * random wclevel ;
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
		call compile format ["nil = [%1ups,'%2'] spawn WC_fnc_creategroup;", _markername, _x];
	}foreach _listglobal;

	true;