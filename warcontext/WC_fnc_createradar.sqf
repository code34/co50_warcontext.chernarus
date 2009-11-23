	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radar
	// -----------------------------------------------
	 private ["_player", "_radar", "_mydir", "_position", "_object"];

	_player = _this select 1;

	if(side _player == wcside) then {
	 	if(!isnull wcradarW) then {
			if ((position _player) distance (position wcradarW) < 20) then {
				_player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wcradarW;
				wcradarW = objnull;
				publicvariable "wcradarW";
				nil = [nil,nil,rHINT,'RADAR has been removed'] call RE;
			}else{
				hint 'RADAR already exists. Check map';
			};
		} else {
			_list = nearestObjects [_player,["Misc_cargo_cont_net1"],10];
			if(count _list > 0) then {
				_mydir = getdir _player;
				_position =  [(getposatl _player select 0) + (sin _mydir * 10), (getposatl _player select 1) + (cos _mydir * 10), (getposatl _player) select 2];
				_object = _list select 0;
				deletevehicle _object;
	
				for "_x" from 1 to 4 step 1 do {	
					_player playMove "AinvPknlMstpSlayWrflDnon_medic";
					sleep 4;
				};
	
				wcradarW = "CDF_WarfareBAntiAirRadar" createVehicle _position;
				wcradarW setposatl _position;
				wcradarW setVectorUp [0,0,1];
				publicvariable "wcradarW";
				nil = [nil,nil,rHINT,'RADAR is Deployed'] call RE;
			} else {
				hint "No construction Kit near";
			};
		};
	} else {
	 	if(!isnull wcradarE) then {
			if ((position _player) distance (position wcradarE) < 20) then {
				_player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wcradarE;
				wcradarE = objnull;
				publicvariable "wcradarE";
				nil = [nil,nil,rHINT,'RADAR has been removed'] call RE;
			}else{
				hint 'RADAR already exists. Check map';
			};
		} else {
			_list = nearestObjects [_player,["Misc_cargo_cont_net1"],10];
			if(count _list > 0) then {
				_mydir = getdir _player;
				_position =  [(getposatl _player select 0) + (sin _mydir * 10), (getposatl _player select 1) + (cos _mydir * 10), (getposatl _player) select 2];
				_object = _list select 0;
				deletevehicle _object;
	
				for "_x" from 1 to 4 step 1 do {	
					_player playMove "AinvPknlMstpSlayWrflDnon_medic";
					sleep 4;
				};
	
				wcradarE = "INS_WarfareBAntiAirRadar" createVehicle _position;
				wcradarE setposatl _position;
				wcradarE setVectorUp [0,0,1];
				publicvariable "wcradarE";
				nil = [nil,nil,rHINT,'RADAR is Deployed'] call RE;
			} else {
				hint "No construction Kit near";
			};
		};
	};