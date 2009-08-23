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
	"_cargo",
	"_cargoRelPos",
	"_paraName",
	"_paraPos",
	"_pilot",
	"_vehicle",
	"_typeofvehicle"
	];

	_typeofvehicle		= _this select 0;
	_group			= _this select 1;
	_planeposition		= _this select 2;
	_destinationmarker	= _this select 3;
	_height			= _planeposition select 2;
	_destinationposition	= getmarkerpos _destinationmarker;
	_markersize		= getmarkersize _destinationmarker select 0;

	if (isnil ("_height")) then { _height = 150; };

	_cargo = [[_planeposition select 0, _planeposition select 1, _height], 0, _typeofvehicle, west] call BIS_fnc_spawnVehicle;
	_vehicle = _cargo select 0;
	_crew = _cargo select 1;
	_pilot = _crew select 0;
	_pilot flyInHeight _height;

	_paraName 	= "ParachuteWest";
	_listofgroup 	= units _group;

	_distance = position _vehicle distance _destinationposition;
	while {(_distance > _markersize )} do {
		_distance = position _vehicle distance _destinationposition;
		call compile format[" hint 'Distance of Dropzone: %1'; ", _distance];
		_pilot commandMove _destinationposition;
		_pilot flyInHeight _height;
		sleep 2;
	};

	_index = 0;
	{
		_destinationposition = getposatl _vehicle;
		_pos = [(_destinationposition select 0), (_destinationposition select 1), (_destinationposition select 2) - 30];
		_paraPos = _pos;
		//_cargoRelPos = [0,0,0];
		//_paraPos = [(_pos select 0) + (_cargoRelPos select 0), (_pos select 1) + (_cargoRelPos select 1), (_pos select 2) + (_cargoRelPos select 2)];

		//_x setpos _pos;
		//_x setVelocity [(((velocity _vehicle) select 0) / 2),(((velocity _vehicle) select 1) / 2),((velocity _vehicle) select 2) - 25];
		//_x setDir (direction _vehicle);

		_para = createvehicle [_paraName, _paraPos ,[],0,'NONE'];
		_para setDir (direction _vehicle);
		//_para setVelocity [(((velocity _vehicle) select 0) / 2),(((velocity _vehicle) select 1) / 2),((velocity _vehicle) select 2) - 25];
		//_para setVelocity [((velocity _x) select 0),((velocity _x) select 1) ,((velocity _x) select 2) ];
		_x moveindriver _para;
		sleep random 1;
	} foreach _listofgroup;

	_result = [_vehicle, _group];
	_result;