	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Liberate Island
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_location", "_distance", "_distancemax", "_lastposition"];

	_lastposition = position WBASE_MOBILE;
	while {!wcgameend or count wctownlocations == 0} do {
		_distancemax = 30000;
		{
			_distance = (position _x) distance _lastposition;
			if(_distance < _distancemax) then {
				_distancemax = _distance;
				_location = _x;
			};
		}foreach wctownlocations;
		wctownlocations = wctownlocations - [_location];
		_lastposition = position _location;
		wcpapabear = "MAIN OBJECTIVE: YOU HAVE TO CONQUER THE TOWN OF " + text _location; publicvariable 'wcpapabear';
		_marker = ['cleartown', 3, _lastposition, 'ColorRed', 'ICON', 'FDIAGONAL', 'Select', 0, 'Clear town', true] call WC_fnc_createmarker;
		[_marker] spawn {
			private ["_timer"];
			_marker = _this select 0;
			_timer = 0;
			while { _timer < 30} do {
				_marker setmarkersize [5,5];
				sleep 1;
				_marker setmarkersize [4,4];
				sleep 1;
				_marker setmarkersize [3,3];
				sleep 1;
				_marker setmarkersize [2,2];
				sleep 1;
				_timer = _timer + 1;
			};
			_marker setmarkersize [4,4];
		};
		nil = ['flagtown'+ text _location, 0.5, _lastposition, 'Default', 'ICON', 'FDIAGONAL', 'Faction_RU', 0, '', true] call WC_fnc_createmarker;
		waituntil {side _location == wcside};
		wcarraymarker = wcarraymarker - ['cleartown'];
		deletemarker "cleartown";
		sleep 20;
	};

	wcpapabear = "GREAT JOB GUYS: YOU ARE HEROES! ALL THE ISLAND HAS BEEN CONQUERED "; publicvariable 'wcpapabear';
	wcgameend = true;
	publicvariable "wcgameend";