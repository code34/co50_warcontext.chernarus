	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radar
	// -----------------------------------------------
	 private ["_position"];

	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 4;

	_mydir = getdir player;
	_position =  [(getposasl player select 0) + (sin _mydir * 2), (getposasl player select 1) + (cos _mydir * 2), (getposasl player) select 2];
	_list = nearestObjects [player,["LandVehicle", "Air", "Tank", "Car"],10];
	_object = _list select 0;

	if (getdammage _object > 0.20) then {
		_object setdammage (getdammage _object - 0.1);
		hint format["Repairing: %1. Dammage at: %2", typeOf _object, getdammage _object];
	} else {
		hint "You can not repair more";
	};

	true;
