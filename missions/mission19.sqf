	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: 
	// -----------------------------------------------
	private ["_townposition", "_position", "_markername", "_count"];

	wcmissionauthor ="=[A*C]= code34";
	wcmissiondescription = "Today it is your turn. Your squad had been assigned to patrol in friendly citie. 
	There is no particular goal: watch and inform us immediatly if something happens. No enemy had been detected in this area since a long time.";
	wcmissiontarget = "Friendly Town";

	wcmission19start = false;

	_townposition = [wcmaptopright, wcmapbottomleft, "invillage"] call WC_fnc_createposition;
	_nearestCity = nearestLocation [_townposition, "NameVillage"];
	_townposition = position _nearestCity;

	wcmissionname = "On guard at " + text _nearestCity;

	wcmissionposition = _townposition;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 2000;
	_markername = "townposition";
	nil = [_markername, _markersize, _townposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_trg = createTrigger["EmptyDetector", _townposition]; 
	_trg setTriggerArea[500, 500 ,0,false];
	_trg setTriggerActivation["WEST","PRESENT",false];
	_trg setTriggerStatements["count thislist > 4", "
		wcmission19start = true;
	", ""];

	waituntil {(wcmission19start)};

	player setpos _townposition;
	
	_count = 0;
	while { _count < 10 } do {
		_count = _count + 1;
		_position = _townposition;
		while {_position distance _townposition < 1000} do {
			_position = [_markername] call WC_fnc_createpositioninmarker;
		};
		_units = ["RUS_Soldier1","RUS_Soldier1","RUS_Soldier1","RUS_Soldier1","RUS_Soldier1"];
		_group = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
		_wp = _group addWaypoint [_townposition, 0];
		sleep 1;			
	};

	sleep 120;

	_trg = createTrigger["EmptyDetector", _townposition]; 
	_trg setTriggerArea[500, 500 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT", false];
	_trg setTriggerStatements["count thislist < 4", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Zone is clear!'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	", ""];