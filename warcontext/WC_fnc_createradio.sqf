	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radio
	// -----------------------------------------------
	 private ["_radio", "_mydir", "_position"];

	if(side player == wcside) then {
	 	if(!isnull wcradioW) then {
			if ((position player) distance (position wcradioW) < 20) then {
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wcradioW;
				wcradioW = objnull;
				publicvariable "wcradioW";
				nil = [nil,nil,rHINT,'RADIO has been removed'] call RE;
				_mydir = getdir player;
				_position =  [(getposatl player select 0) + (sin _mydir * 5), (getposatl player select 1) + (cos _mydir * 5), (getposatl player) select 2];
				_object = "Misc_cargo_cont_net1" createVehicle _position;
				_object setposatl _position;
				wcconstructionkitposition = _position;
				publicvariable 'wcconstructionkitposition';
			}else{
				hint 'RADIO already exists. Check map';
			};
		} else {
			_list = nearestObjects [player,["Misc_cargo_cont_net1"],10];
			if(count _list > 0) then {
				_mydir = getdir player;
				_position =  [(getposatl player select 0) + (sin _mydir * 10), (getposatl player select 1) + (cos _mydir * 10), (getposatl player) select 2];
				_object = _list select 0;
				deletevehicle _object;
	
				for "_x" from 1 to 4 step 1 do {
					player playMove "AinvPknlMstpSlayWrflDnon_medic";
					sleep 4;
				};
		
				wcradioW = "CDF_WarfareBUAVterminal" createVehicle _position;
				wcradioW setposatl _position;
				wcradioW setVectorUp [0,0,1];
				publicvariable "wcradioW";
				nil = [nil,nil,rHINT,'RADIO is Deployed'] call RE;
			} else {
				hint "No construction Kit near";
			};
		};
	} else {
	 	if(!isnull wcradioE) then {
			if ((position player) distance (position wcradioE) < 20) then {
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wcradioE;
				wcradioE = objnull;
				publicvariable "wcradioE";
				nil = [nil,nil,rHINT,'RADIO has been removed'] call RE;
				_mydir = getdir player;
				_position =  [(getposatl player select 0) + (sin _mydir * 5), (getposatl player select 1) + (cos _mydir * 5), (getposatl player) select 2];
				_object = "Misc_cargo_cont_net1" createVehicle _position;
				_object setposatl _position;
				wcconstructionkitposition = _position;
				publicvariable 'wcconstructionkitposition';
			}else{
				hint 'RADIO already exists. Check map';
			};
		} else {
			_list = nearestObjects [player,["Misc_cargo_cont_net1"],10];
			if(count _list > 0) then {
				_mydir = getdir player;
				_position =  [(getposatl player select 0) + (sin _mydir * 10), (getposatl player select 1) + (cos _mydir * 10), (getposatl player) select 2];
				_object = _list select 0;
				deletevehicle _object;
	
				for "_x" from 1 to 4 step 1 do {
					player playMove "AinvPknlMstpSlayWrflDnon_medic";
					sleep 4;
				};
		
				wcradioE = "CDF_WarfareBUAVterminal" createVehicle _position;
				wcradioE setposatl _position;
				wcradioE setVectorUp [0,0,1];
				publicvariable "wcradioE";
				nil = [nil,nil,rHINT,'RADIO is Deployed'] call RE;
			} else {
				hint "No construction Kit near";
			};
		};
	}