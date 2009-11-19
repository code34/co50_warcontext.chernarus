	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an HOSPITAL
	// -----------------------------------------------
	 private ["_hospital", "_mydir", "_position"];

	if (side player == wcside) then {
	 	if(!isnull wchospitalW) then {
			if ((position player) distance (position wchospitalW) < 20) then {
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wchospitalW;
				wchospitalW = objnull;
				publicvariable "wchospitalW";
				nil = [nil,nil,rHINT,'Hospital has been removed'] call RE;
				_mydir = getdir player;
				_position =  [(getposatl player select 0) + (sin _mydir * 5), (getposatl player select 1) + (cos _mydir * 5), (getposatl player) select 2];
				_object = "Misc_cargo_cont_net1" createVehicle _position;
				_object setposatl _position;
				wcconstructionkitposition = _position;
				publicvariable 'wcconstructionkitposition';
	
			}else{
				hint 'Hospital already exists. Check map';
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
	
				wchospitalW = "CDF_WarfareBFieldhHospital" createVehicle _position;
				wchospitalW setposatl _position;
				wchospitalW setVectorUp [0,0,1];
				publicvariable "wchospitalW";
				nil = [nil,nil,rHINT,'Hospital is Deployed'] call RE;
			} else {
				hint "No construction Kit near";
			};		
		};
	} else {
	 	if(!isnull wchospitalE) then {
			if ((position player) distance (position wchospitalE) < 20) then {
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wchospitalE;
				wchospitalE = objnull;
				publicvariable "wchospitalE";
				nil = [nil,nil,rHINT,'Hospital has been removed'] call RE;
				_mydir = getdir player;
				_position =  [(getposatl player select 0) + (sin _mydir * 5), (getposatl player select 1) + (cos _mydir * 5), (getposatl player) select 2];
				_object = "Misc_cargo_cont_net1" createVehicle _position;
				_object setposatl _position;
				wcconstructionkitposition = _position;
				publicvariable 'wcconstructionkitposition';
	
			}else{
				hint 'Hospital already exists. Check map';
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
	
				wchospitalE = "CDF_WarfareBFieldhHospital" createVehicle _position;
				wchospitalE setposatl _position;
				wchospitalE setVectorUp [0,0,1];
				publicvariable "wchospitalE";
				nil = [nil,nil,rHINT,'Hospital is Deployed'] call RE;
			} else {
				hint "No construction Kit near";
			};		
		};
	};