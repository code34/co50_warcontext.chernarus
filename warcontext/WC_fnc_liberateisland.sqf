	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Liberate Island
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_location", 
		"_distance", 
		"_distancemax", 
		"_lastposition", 
		"_marker", 
		"_markername",
		"_object",
		"_objindex"
		];

	waituntil {!isnil "wcinitialised"};

	_lastposition = position WBASE_MOBILE;

	_objindex = 0;
	while {!wcgameend and count wctownlocations > 0} do {
		_distancemax = 30000;
		{
			_distance = (position _x) distance _lastposition;
			if(_distance < _distancemax) then {
				_distancemax = _distance;
				_location = _x;
			};
		}foreach wctownlocations;
		wctownlocations = wctownlocations - [_location];

		// Create Trigger in town
		_location setSide wcenemyside;
		_markername = format ["mrk%1", _objindex];
		_object = "Land_telek1";
		_objindex = _objindex + 1;
		nil = [_location, _markername, _object, _objindex] spawn WC_fnc_createtrigger;

		_lastposition = position _location;
		wcmainmissionW = _location;
		wcmainmissionE = _location;		
		publicvariable "wcmainmissionW";
		publicvariable "wcmainmissionE";
		waituntil {side _location == wcside};
		sleep 20;
	};

	wcgameend = true;
	publicvariable "wcgameend";