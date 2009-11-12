	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an HOSPITAL
	// -----------------------------------------------
	 private ["_hospital", "_mydir", "_position"];

 	if(!isnull wchospital) then {
		if ((position player) distance (position wchospital) < 20) then {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 4;
			deletevehicle wchospital;
			wchospital = objnull;
			publicvariable "wchospital";
			nil = [nil,nil,rHINT,'Hospital has been removed'] call RE;
		}else{
			hint 'Hospital already exists. Check map';
		};
	} else {
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 4;
		_mydir = getdir player;
		_position =  [(getposasl player select 0) + (sin _mydir * 10), (getposasl player select 1) + (cos _mydir * 10), (getposasl player) select 2];
		wchospital = "CDF_WarfareBFieldhHospital" createVehicle _position;
		wchospital setposasl _position;
		publicvariable "wchospital";
		nil = [nil,nil,rHINT,'Hospital is Deployed'] call RE;
	};