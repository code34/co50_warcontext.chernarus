	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Restore building / compositions that have been backup from Merlin
	// Position is the center of composition
	// Remix of BIS Composition script
	// -----------------------------------------------

	private [
		"_position",
		"_dir",
		"_typeof",
		"_arrayof",
		"_building",
		"_group",
		"_leader",
		"_marker",
		"_markername",
		"_markersize",
		"_grouped",
		"_scriptinit",
		"_type",
		"_triggerside",
		"_triggerobjective",
		"_triggersize"
		];

	_arrayof  = _this select 0;
	_withmen  = _this select 1;

	{
		_type = _x select 0;
		switch (_type) do {
			case "Create":
			{
				_attitude = (_x select 2) select 2;
				if (count ((_x select 2) select 0) > 1) then {
					_typeof = (_x select 2) select 0;
					_grouped = true;
				} else {
					_typeof = ((_x select 2) select 0) select 0;
					_grouped = false;
				};
				_dir = (_x select 2) select 3;
				_markersize = (_x select 2) select 4;
				_position = _x select 3;

				if (_grouped) then {
					_group = [_position, east, _typeof, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
					switch (_attitude) do {
						case "UPS":
							{
								_markername = format["merlin%1ups", wcmerlinmrk];
								wcmerlinmrk = wcmerlinmrk + 1;
								_marker = [_markername, _markersize, _position, 'Default', 'ICON', 'FDIAGONAL', 'EMPTY'] call WC_fnc_createmarker;
								_scriptinit = format["nil = [this, '%1', 'noslow'] execVM 'extern\ups.sqf';", _markername];
								_leader = leader _group;
								_leader setVehicleInit _scriptinit;
								processInitCommands;
							};
		
						default 
							{

							};
					};
				} else {
					_building = _typeof createVehicle _position;
					_building setposATL _position;
					_building setdir _dir;
					_building setVectorUp [0,0,1];
					_building addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
					if (_withmen) then {
						_group = creategroup wcenemyside;
						if (_building emptyPositions "driver" > 0) then {
							_soldier = _group createUnit ["RU_Soldier_Crew", _pos, [], 0, "NONE"];
							_soldier assignAsDriver _building;
							_soldier moveindriver _building;
							nil = [_soldier, wcskill] spawn WC_fnc_setskill;
							_soldier addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
						};
						if (_building emptyPositions "gunner" > 0) then {
							_soldier = _group createUnit ["RU_Soldier_Crew", _pos, [], 0, "NONE"];
							_soldier assignAsgunner _building;
							_soldier moveingunner _building;
							nil = [_soldier, wcskill] spawn WC_fnc_setskill;
							_soldier addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
						};
						if (_building emptyPositions "commander" > 0) then {
							_soldier = _group createUnit ["RU_Soldier_Crew", _pos, [], 0, "NONE"];
							_soldier assignAscommander _building;
							_soldier moveincommander _building;
							nil = [_soldier, wcskill] spawn WC_fnc_setskill;
							_soldier addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
						};
						_markername = format["merlin%1ups", wcmerlinmrk];
						wcmerlinmrk = wcmerlinmrk + 1;
						_marker = [_markername, _markersize, _position, 'Default', 'ICON', 'FDIAGONAL', 'EMPTY'] call WC_fnc_createmarker;
						_scriptinit = format["nil = [this, '%1', 'noslow'] execVM 'extern\ups.sqf';", _markername];
						_leader = leader _group;
						_leader setVehicleInit _scriptinit;
						processInitCommands;						
					};
				};
			};

			case "Area Objective": 
			{
				_triggerside = (_x select 2) select 1;
				_triggerobjective = (_x select 2) select 2;
				_triggersize = (_x select 2) select 5;
				_position = _x select 3;
			
				_trg = createTrigger["EmptyDetector", _position]; 
				_trg setTriggerArea[_triggersize, _triggersize, 0, false];
				_trg setTriggerActivation[_triggerside, _triggerobjective, false];
				_trg setTriggerStatements["this", "
					wcsuccess = true; 
					publicvariable 'wcsuccess'; 
					wcsuccess = false;
					wcmissionok = true;
					wcmissionclear = true;
				", ""];
			};

			default
			{

			};
		};
		sleep 0.1;
	}foreach _arrayof;

	_group;