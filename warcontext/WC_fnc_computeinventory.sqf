	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// Compute Inventory for all game 
	// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_randomvehicle", "_randomunit"];

	_randomvehicle = [
		"bmp",
		"shilka",
		"t72",
		"t90",
		"tunguska",
		"uralrepair",
		"uralreammo",
		"uralrefuel"
	];

	_randomunit = [
		"army1",
		"special1",
		"special2"
	];


	for "_x" from 0 to wcmaxvehicle do {
		wcvehicleinventory = wcvehicleinventory + [_randomvehicle call BIS_fnc_selectRandom];
	};

	for "_x" from 0 to wcmaxunit do {
		wcunitinventory = wcunitinventory + [_randomunit call BIS_fnc_selectRandom];
	};