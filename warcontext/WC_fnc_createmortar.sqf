	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radar
	// -----------------------------------------------
	 private ["_mortar", "_mydir", "_position"];

	_list = nearestObjects [player,["Misc_cargo_cont_net1"],10];
	if(count _list > 0) then {
		_mydir = getdir player;
		_position =  [(getposatl player select 0) + (sin _mydir * 5), (getposatl player select 1) + (cos _mydir * 5), (getposatl player) select 2];
		_object = _list select 0;
		deletevehicle _object;

		for "_x" from 1 to 4 step 1 do {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 4;
		};

		if(side player == wcside) then {
			_mortar = "M252" createVehicle _position;
		} else {
			_mortar = "2b14_82mm" createVehicle _position;
		};

		_mortar setposatl _position;
		[_mortar] call BIS_ARTY_F_initVehicle;

		_mortar addEventHandler ["GETIN", "
			if (typeof(_this select 2) != 'USMC_Soldier' and typeof(_this select 2) != 'RU_Soldier') then {
				(_this select 2) action['EJECT',(_this select 0)];
			};
		"];
		hint "Mortar is deployed";
	} else {
		_list = nearestObjects [player,["M252"], 5];
		if(count _list > 0) then {
			_object = _list select 0;
			deletevehicle _object;
			nil = [nil,nil,rHINT,'Mortar has been removed'] call RE;
		} else {
			hint "No construction kits near !";
		};
	};