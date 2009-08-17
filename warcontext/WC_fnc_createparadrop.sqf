// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith {};

private [
	"_destinationposition",
	"_sourceposition",
	"_height",
	"_side",
	"_trg",
	"_crew",
	"_vehicle"
	];

	_vehicle		= _this select 0;
	wcobjecttodrop		= _this select 1;
	_sourceposition		= _this select 2;
	_destinationposition	= _this select 3;
	_height			= _sourceposition select 2;

	if (isnil ("_height")) then { _height = 400; };
	
	wccargo = [[_sourceposition select 0, _sourceposition select 1, _height], 0, _vehicle, west] call BIS_fnc_spawnVehicle;
	wcparadroppilot = wccargo select 1;
	wcparadroppilot commandMove _destinationposition;

	_trg = createTrigger["EmptyDetector", _destinationposition]; 
	_trg setTriggerArea[500, 500 ,0, false];
	_trg setTriggerActivation["WEST", "PRESENT", true];
	_trg setTriggerStatements["wcparadroppilot in thislist", "
		[wccargo select 0, wcobjecttodrop] spawn BIS_fnc_supplyDrop;
		nil = [nil,nil,rHINT,'Paradrop has been done.'] call RE;
	", ""];

	true;