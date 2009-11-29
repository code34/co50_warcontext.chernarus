	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: Paradrop smoke
	// -----------------------------------------------

	private ["_vehicle", "_smoke"];

	if !(_vehicle getVariable "wcsmoke") exitWith {hint "No smoke in board";};

	_vehicle = _this select 0;
	for "_x" from 0 to 5 step 1 do {
		_smoke = createVehicle ["SmokeShell", position _vehicle, [], 10, "NONE"];
	};

	true;