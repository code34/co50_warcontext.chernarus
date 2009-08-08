// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith {};

private [
	"_positiontodrop",
	"_sourceposition",
	"_height",
	"_side",
	"_trg",
	"_crew"
	];

	_vehicle	= _this select 0;
	wcobjecttodrop	= _this select 1;
	_positiontodrop	= _this select 2;
	_sourceposition = _this select 3;
	_height 	= _positiontodrop select 2;
	_side		= wcside;
	
	wccargo = [[_sourceposition select 0, _sourceposition select 1, _height], 0, _vehicle, wcside] call BIS_fnc_spawnVehicle;
	_crew = wccargo select 1;
	_crew commandMove _positiontodrop;

	_trg = createTrigger["EmptyDetector", _positiontodrop]; 
	_trg setTriggerArea[100, 100 ,0,false];
	_trg setTriggerActivation[wcside, "PRESENT", true];
	_trg setTriggerStatements["wccargo in thislist", "
	[wccargo, wcobjecttodrop] call BIS_fnc_supplyDrop;
	", ""];