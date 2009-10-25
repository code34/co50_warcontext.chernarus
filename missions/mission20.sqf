	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------
	private ["_trg", "_aurelien", "_position"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Bad guy";
	wcmissiondescription = "A Tchernogorsk notable asked us to retrieve his little son, code-named 'Aurelien'. Little son lost his way while he was hiking with its cycle. He is missing since 2 days. You must retrieve it safe.";
	wcmissiontarget = "";

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;


	_vtt = "mmt_civ" createVehicle _position;
	[_vtt, "Aurelien", 1, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Aurelien'] spawn WC_fnc_attachmarker;

	_group = creategroup east;	
	_aurelien = _group createUnit ["RU_Rocker1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_aurelien assignAsDriver _vtt;
	_aurelien moveindriver _vtt;
	
	_aurelien addeventhandler ['killed', {
		wcfail = true; 
		publicvariable 'wcfail'; 
		wcfail = false;
		nil = [nil,nil,rHINT,'Aurelien is Dead.'] call RE;
		wcmissionok = false;
		wcmissionclear = true;
	}];

	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[5, 5 ,0,false];
	_trg setTriggerActivation["WEST","PRESENT", false];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Aurelien is safe!'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	"", """"];", wclevel];

	nil = [_aurelien, _trg, 2] spawn WC_fnc_attachtrigger;

	while {(alive _aurelien)} do {
		_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
		_aurelien commandMove _position;
		_aurelien allowFleeing 0;
		waituntil {(_aurelien distance _position < 200)};
	};