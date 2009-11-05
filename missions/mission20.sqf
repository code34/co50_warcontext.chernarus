	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_trg", "_aurelien", "_position", "_counter", "_lastposition", "_missionend", "_vtt"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Bad guy";
	wcmissiondescription = "A Tchernogorsk notable asked us to retrieve his little son, code-named 'Aurelien'. Little son lost his way while he was hiking with its cycle. He is missing since 2 days. You must retrieve it safe.";
	wcmissiontarget = "";

	wcaurelienfound = false;

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_vtt = "mmt_civ" createVehicle _position;
	[_vtt, "Aurelien", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Aurelien'] spawn WC_fnc_attachmarker;

	_group = creategroup east;	
	_aurelien = _group createUnit ["RU_Rocker1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_aurelien assignAsDriver _vtt;
	_aurelien moveindriver _vtt;
	_group setSpeedMode "FULL";

	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[5, 5 ,0,false];
	_trg setTriggerActivation["WEST","PRESENT", false];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcaurelienfound = true;
	"", """"];", wclevel];

	nil = [_aurelien, _trg, 2] spawn WC_fnc_attachtrigger;

	_counter = 0;
	_missionend = false;
	_lastposition = [0,0,0];
	while { !_missionend } do {
		if (getdammage _aurelien < 0.8) then {
			_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
			_aurelien doMove _position;
		};
		if (getdammage _aurelien > 0.79 or !alive _aurelien) then {
			_aurelien setdamage 1;
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Aurelien is dead.'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if (_counter > 30) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. Aurelien is totaly lost'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if ((position _aurelien) distance _lastposition < 10) then {
			_vtt setpos [(((position _aurelien) select 0) + 5),  ((position _aurelien) select 1)];
			_aurelien assignAsDriver _vtt;
			_aurelien moveindriver _vtt;
			_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
			_aurelien doMove _position;
		};
		if (wcaurelienfound) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'Aurelien is safe!'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = 10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		_lastposition = position _aurelien;
		_counter = _counter + 1;
		sleep 60;
	};

	deletevehicle _trg;