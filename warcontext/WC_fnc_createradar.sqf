	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radar
	// -----------------------------------------------
	 private ["_radar", "_mydir", "_position"];

 	if(!isnull wcradar) then {
		if ((position player) distance (position wcradar) < 20) then {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 4;
			deletevehicle wcradar;
			wcradar = objnull;
			publicvariable "wcradar";
			nil = [nil,nil,rHINT,'RADAR has been removed'] call RE;
		}else{
			hint 'RADAR already exists. Check map';
		};
	} else {
		_mydir = getdir player;
		_position =  [(getposasl player select 0) + (sin _mydir * 10), (getposasl player select 1) + (cos _mydir * 10), (getposasl player) select 2];
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 4;
		wcradar = "CDF_WarfareBAntiAirRadar" createVehicle _position;
		wcradar setposasl _position;
		publicvariable "wcradar";
		nil = [nil,nil,rHINT,'RADAR is Deployed'] call RE;
	};