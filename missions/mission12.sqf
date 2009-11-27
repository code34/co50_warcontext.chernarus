	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CLEAN
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_vehicle", "_group", "_group2", "_leader", "_position", "_destinationposition", "_missionend", "_driver", "_waypoint", "_destinationposition", "_nearestCity", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Bad trust";
	wcmissiondescriptionW = "There is in this region, a guerilla troop which fights for us,the Green bullets. Regrettably, they are not reliable. Reports indicate kidnapping and executions aiming  the civilians in nearest villages. We have to stop these crimes before the population accuses us because we armed the Green bullets!";
	wcmissiondescriptionE = "You just have some informations about guerilla troop that kill civilians.";
	wcmissiontarget = "Guerilleros";
	_missionnumber = 12;
		
	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_destinationposition = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;

	while {_position distance _destinationposition < 5000} do {
		_destinationposition = [wcmaptopright, wcmapbottomleft, "onground"] call WC_fnc_createposition;
	};

	_nearestCity = nearestLocation [_destinationposition, "NameVillage"];
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
	nil = [_markername, _markersize, _destinationposition, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
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
	_counter = 0;
	while { !_missionend } do {
		if (!alive _vehicle) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: Nobody wins ! Guerilla is down !'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (count (units _group) < 2) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: Nobody wins ! Guerilla is down !'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (count (units _group2) < 4) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! Civil has been killed'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
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
		_counter = _counter + 1;
		sleep 60;
	};