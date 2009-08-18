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
	"_group",
	"_vehicle"
	];

	_vehicle		= _this select 0;
	wcobjecttodrop		= _this select 1;
	_sourceposition		= _this select 2;
	_destinationposition	= _this select 3;
	_height			= _sourceposition select 2;

	if (isnil ("_height")) then { _height = 400; };
	
	_cargo = [[_sourceposition select 0, _sourceposition select 1, _height], 0, _vehicle, west] call BIS_fnc_spawnVehicle;
	_pilot = wccargo select 1;
	_vehicle = wccargo select 0;
	_pilot commandMove _destinationposition;

	_position = position _vehicle;
	_units = ["GUE_Worker2","GUE_Woodlander3","GUE_Villager3","GUE_Woodlander2","GUE_Woodlander1","GUE_Villager4"];
	_group = [_position, west, _units, [], [],[0.01,0.01,0.01]] call BIS_fnc_spawnGroup;
	[_vehicle, _group] spawn WC_fnc_supplyGroup;
	nil = [nil,nil,rHINT,'Paradrop has been done.'] call RE;

	true;