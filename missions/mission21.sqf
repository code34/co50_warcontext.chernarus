	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_group", "_position", "_rescued", "_counter", "_missionnumber"];

	wcmissionauthor = "=[A*C]=Lueti";
	wcmissionname = "Rescue the survivors";
	wcmissiondescriptionW = "There was fighting between rebels and Russians. Unfortunately, there have been civilian casualties and many of them are injured area. Go to the area to heal. But be careful, the fighting may not be over!";
	wcmissiondescriptionE = "You must go to this village and do your best that still no traces of civils";
	wcmissiontarget = "Rescue";
	_missionnumber = 21;

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_nearestCity = nearestLocation [_position, "NameVillage"];
	_position = position _nearestCity;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 500;
	_markername = "missiontownposition";
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_units = ["RU_Citizen1","RU_Citizen2","RU_Damsel1","RU_Damsel2","RU_Citizen1","RU_Citizen2","RU_Damsel1","RU_Damsel2"];
	_group = [_position, west, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	
	{
		_x setdammage 0.9;
	}foreach (units _group);

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		_rescued = 0;
		if (count (units _group) < 8) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! Civils has been killed'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (count (units _group) == 8) then {
			{		
				if (getdammage _x < 0.5) then {_rescued = _rescued + 1;};

			}foreach (units _group);
		};
		if (_rescued == 8) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: West wins ! Civils has been rescued'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late!'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		sleep 60;
		_counter = _counter + 1;
	};