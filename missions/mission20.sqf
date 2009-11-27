	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_trg", "_aurelien", "_position", "_counter", "_lastposition", "_missionend", "_vtt", "_missionnumber"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Bad guy";
	wcmissiondescriptionW = "A Tchernogorsk notable asked us to retrieve his little son, code-named 'Aurelien'. Little son lost his way while he was hiking with its cycle. He is missing since 2 days. You must retrieve it safe.";
	wcmissiondescriptionE = "Kill the son of Tchernogorsk notable that fight against us";
	wcmissiontarget = "";
	_missionnumber = 20;

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
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! Aurelien is dead.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (_counter > 30) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! Aurelien is totaly lost'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
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
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: West wins ! Aurelien is safe!'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		_lastposition = position _aurelien;
		_counter = _counter + 1;
		sleep 60;
	};

	sleep 120;

	deletevehicle _trg;
	deletevehicle _vtt;
	_aurelien setdammage 1;
	deletevehicle _aurelien;