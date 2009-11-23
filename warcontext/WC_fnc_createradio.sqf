	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an radio
	// -----------------------------------------------
	 private ["_radio", "_mydir", "_position", "_player"];

	_player = _this select 1;

	if(side _player == wcside) then {
	 	if(!isnull wcradioW) then {
			if ((position _player) distance (position wcradioW) < 20) then {
				_player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wcradioW;
				wcradioW = objnull;
				publicvariable "wcradioW";
				nil = [nil,nil,rHINT,'RADIO has been removed'] call RE;
			}else{
				hint 'RADIO already exists. Check map';
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
			if ((position _player) distance (position wcradioE) < 20) then {
				_player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wcradioE;
				wcradioE = objnull;
				publicvariable "wcradioE";
				nil = [nil,nil,rHINT,'RADIO has been removed'] call RE;
			}else{
				hint 'RADIO already exists. Check map';
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
		
				wcradioE = "INS_WarfareBUAVterminal" createVehicle _position;
				wcradioE setposatl _position;
				wcradioE setVectorUp [0,0,1];
				publicvariable "wcradioE";
				nil = [nil,nil,rHINT,'RADIO is Deployed'] call RE;
			} else {
				hint "No construction Kit near";
			};
		};
	}