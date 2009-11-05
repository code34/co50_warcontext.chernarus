	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_group", "_position", "_rescued"];

	wcmissionauthor = "=[A*C]=Lueti";
	wcmissionname = "Rescue the survivors";
	wcmissiondescription = "There was fighting between rebels and Russians. Unfortunately, there have been civilian casualties and many of them are injured area. Go to the area to heal. But be careful, the fighting may not be over!";
	wcmissiontarget = "Rescue";

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_nearestCity = nearestLocation [_position, "NameVillage"];
	_position = position _nearestCity;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 500;
	_markername = "townposition";
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_units = ["RU_Citizen1","RU_Citizen2","RU_Damsel1","RU_Damsel2","RU_Citizen1","RU_Citizen2","RU_Damsel1","RU_Damsel2"];
	_group = [_position, west, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	
	{
		_x setdammage 0.9;
	}foreach (units _group);

	_missionend = false;
	while { !_missionend } do {
		_rescued = 0;
		if (count (units _group) < 8) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. Civils has been killed'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if (count (units _group) == 8) then {
			{		
				if (getdammage _x < 0.5) then {_rescued = _rescued + 1;};

			}foreach (units _group);
		};
		if (_rescued == 8) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'Mission Success. Civils has been rescued'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			wcscore = 10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		sleep 60;
	};