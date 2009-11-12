	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radio
	// -----------------------------------------------
	 private ["_radio", "_mydir", "_position"];

 	if(!isnull wcradio) then {
		if ((position player) distance (position wcradio) < 20) then {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 4;
			deletevehicle wcradio;
			wcradio = objnull;
			publicvariable "wcradio";
			nil = [nil,nil,rHINT,'RADIO has been removed'] call RE;
		}else{
			hint 'RADIO already exists. Check map';
		};
	} else {
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 4;
		_mydir = getdir player;
		_position =  [(getposasl player select 0) + (sin _mydir * 10), (getposasl player select 1) + (cos _mydir * 10), (getposasl player) select 2];
		wcradio = "CDF_WarfareBUAVterminal" createVehicle _position;
		wcradio setposasl _position;
		publicvariable "wcradio";
		nil = [nil,nil,rHINT,'RADIO is Deployed'] call RE;
	};