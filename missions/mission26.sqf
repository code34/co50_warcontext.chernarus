	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------

	private ["_missionend", "_counter", "_missionnumber"];

	wcmissionauthor = "=[A*C]= Lueti";
	wcmissionname = "Free frequency";
	wcmissiondescriptionW = "A regional radio, controlled by the Russians, harangue the population against the American strengths. It is necessary to destroy this propaganda object.";
	wcmissiondescriptionE = "A very good musical and politic radio is the target of enemy, protect it!";
	wcmissiontarget = "Radio tower";
	_missionnumber = 26;

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 100;
	_markername = "sourceposition";
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY'] call WC_fnc_createmarker;

	if(random 1 > 0.5) then {
		nil = [_markername] call WC_fnc_randomizegroup;
	};

	_radiotower = createVehicle ["Land_Antenna", _position, [], 0, "NONE"];
	_object = createVehicle ["PowGen_Big", [_position select 0, (_position select 1) + 30], [], 0, "NONE"];
	nil = ['radiotower', 0.5, position _radiotower, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Destroy Radio tower'] call WC_fnc_createmarker;

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if (getDammage _radiotower > 0.5) then {
			wcmissionokW = [_missionnumber,true];
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'West wins. Radio Tower has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'East wins ! Too late!'] call RE;
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
