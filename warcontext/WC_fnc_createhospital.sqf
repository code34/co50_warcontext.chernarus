	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an HOSPITAL
	// -----------------------------------------------
	 private ["_player", "_hospital", "_mydir", "_position", "_object"];

	_player = _this select 1;

	if (side _player == wcside) then {
	 	if(!isnull wchospitalW) then {
			if ((position _player) distance (position wchospitalW) < 20) then {
				_player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wchospitalW;
				wchospitalW = objnull;
				publicvariable "wchospitalW";
				wcmessageW = "West Hospital has been removed";
				publicvariable "wcmessageW";
	
			}else{
				hint 'Hospital already exists. Check map';
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
	
				wchospitalW = "CDF_WarfareBFieldhHospital" createVehicle _position;
				wchospitalW setposatl _position;
				wchospitalW setVectorUp [0,0,1];
				nil = [wchospitalW, wcside] spawn WC_fnc_checkhospitalalive;
				publicvariable "wchospitalW";
				wcmessageW = "West Hospital is Deployed";
				publicvariable "wcmessageW";
			} else {
				hint "No construction Kit near";
			};		
		};
	} else {
	 	if(!isnull wchospitalE) then {
			if ((position _player) distance (position wchospitalE) < 20) then {
				_player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 4;
				deletevehicle wchospitalE;
				wchospitalE = objnull;
				publicvariable "wchospitalE";
				wcmessageE = "East hospital has been removed";
				publicvariable "wcmessageE";
			}else{
				hint 'Hospital already exists. Check map';
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
	
				wchospitalE = "INS_WarfareBFieldhHospital" createVehicle _position;
				wchospitalE setposatl _position;
				wchospitalE setVectorUp [0,0,1];
				publicvariable "wchospitalE";
				wcmessageE = "East hospital is deployed";
				publicvariable "wcmessageE";
			} else {
				hint "No construction Kit near";
			};		
		};
	};