	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// wcsanity(true) if zone have to be clean, false if zone is currently being monitoring to be clear
	// wczoneready(true) if zone trigger side to pop enemy , false if zone is currently poping enemy
	// markernameclear(false)
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private [
		"_minutes", 
		"_trigger", 
		"_total", 
		"_triggerinventory", 
		"_countW", 
		"_countE", 
		"_result", 
		"_markername", 
		"_location"
	];

	_trigger 	= _this select 0;
	_markername 	= _this select 1;
	_location	= _this select 2;
	_minutes = 2;
	_total = 0;

	 for "_i" from 1 to _minutes do {
	 	sleep 10;
	 	_triggerinventory = list _trigger;
	 	_countW = wcside countSide _triggerinventory;
	 	_countE = wcenemyside countSide _triggerinventory;
	 	if ((_countE < 5) and (_countW > 0)) then { 
	 		_total = _total + 1;
	 	}else{
			hint format["count %1 %2", _countE, _countW];
		};
	 };
		
	 if (_total + 1 >= _minutes) then {
	 	_result = true;
	 	call compile format ["
	 		%1clear = true;
	 		wczoneready%1 = true;
			('flagtown'+ text _location) setMarkerType 'Faction_US';
			nil = [10, wcside] spawn WC_fnc_score;
	 	", _markername];
		_location setside wcside;
	 	nil = [nil,nil,rHINT,'Town is clear'] call RE;
	 };
	true;