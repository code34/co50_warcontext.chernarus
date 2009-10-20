	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SABOTAGE
	// -----------------------------------------------
	if (!isServer) exitWith{};


	wcmissionauthor ="=[A*C]= code34";
	wcmissionname = "On the rail";
	wcmissiondescription = "The south Chernarus rails are a strategic ressource for the enemy force supply. We know that the enemy force are regulary supplied by this way that permit to build a bridge between frontline and safe zone. You must sabotage a train to slow down the enemy progression.";
	wcmissiontarget = "Train";

	_position = [13144, 7073];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_train = "Land_loco_742_blue" createVehicle _position;
	_train setdir 343;

	_units = ["RUS_Soldier1","RUS_Soldier1","RUS_Soldier1"];
	_group = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	[_group, _position, 25] call BIS_fnc_taskPatrol;

	_group2 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	[_group2, _position, 25] call BIS_fnc_taskPatrol;

	_group3 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	[_group3, _position, 25] call BIS_fnc_taskPatrol;

	_train addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Train has been sabotaged.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];