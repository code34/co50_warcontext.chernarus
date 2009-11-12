	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CLEAN
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_vehicle", "_group", "_group2", "_leader", "_position", "_destinationposition", "_missionend", "_driver", "_waypoint", "_destinationposition", "_nearestCity"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Bad trust";
	wcmissiondescription = "There is in this region, a guerilla troop which fights for us,the Green bullets. Regrettably, they are not reliable. Reports indicate kidnapping and executions aiming  the civilians in nearest villages. We have to stop these crimes before the population accuses us because we armed the Green bullets!";
	wcmissiontarget = "Guerilleros";
		
	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_nearestCity = nearestLocation [_position, "NameVillage"];
	_destinationposition = position _nearestCity;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_units = ["GUE_Worker2","GUE_Woodlander3","GUE_Villager3","GUE_Woodlander2","GUE_Woodlander1","GUE_Villager4"];
	_group = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;

	_units = ["RU_Citizen1","RU_Citizen2","RU_Damsel1","RU_Damsel2"];
	_group2 = [_destinationposition, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;

	_horror = createVehicle ["Mass_grave", _position, [], 0, "NONE"];
	_vehicle = createVehicle ["UralCivil2", [_position select 0, (_position select 1) + 5], [], 0, "NONE"];

	_markername = "Green_bullets";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	[_vehicle, 'Guerilla', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Guerilla'] spawn WC_fnc_attachmarker;
	nil = ['Civilians', 0.5, _destinationposition, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Civilians'] call WC_fnc_createmarker;


	{
		if (_vehicle emptyPositions "driver" > 0) then {
			_x moveindriver _vehicle;
		}else{
			_x moveincargo _vehicle;
		};
	}foreach (units _group);

	_driver = driver _vehicle;

	_missionend = false;
	while { !_missionend } do {
		if (!alive _vehicle) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'Guerilla is down !'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = 10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if (count (units _group) < 4) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'Guerilla is down !'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = 10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if (count (units _group2) < 4) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. Civil has been killed'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if ((_driver distance _destinationposition) > 500) then {
			_driver domove _destinationposition;
		} else {
			{
				if (_x in _vehicle) then {
					_x action ["eject", _vehicle];
				};
				_x dofire ((units _group2) select 0);
			}foreach (units _group);
		};
		sleep 4;
	};