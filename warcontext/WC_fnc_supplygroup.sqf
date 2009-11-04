// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith {};

private [
	"_destinationposition",
	"_planeposition",
	"_index",
	"_height",
	"_group",
	"_pos",
	"_vehicle",
	"_cargoRelPos",
	"_paraName",
	"_paraPos",
	"_pilot",
	"_vehicle",
	"_typeofvehicle",
	"_array"
	];

	_typeofvehicle		= _this select 0;
	_group			= _this select 1;
	_planeposition		= _this select 2;
	_destinationmarker	= _this select 3;
	_height			= _planeposition select 2;
	_destinationposition	= getmarkerpos _destinationmarker;
	_markersize		= getmarkersize _destinationmarker select 0;

	if (isnil ("_height")) then { _height = 150; };

	_array = [[_planeposition select 0, _planeposition select 1, _height], 0, _typeofvehicle, west] call BIS_fnc_spawnVehicle;
	_vehicle = _array select 0;
	_pilot = (_array select 1) select 0;
	_vehicle flyInHeight _height;

	while {(position _vehicle) distance _destinationposition > _markersize} do {
		_pilot doMove _destinationposition;
		sleep 120;
	};

	_index = 0;
	{
		_x action ["eject", _vehicle];
	} foreach (units _group);

	_vehicle;