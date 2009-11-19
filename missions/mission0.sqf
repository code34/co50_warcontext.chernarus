	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CLEAR ZONE
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissiondescriptionW = "Enemy force received some reinforcements. Today you have to go to the battlefield and stop the enemy troops. Good luck !";
	wcmissiondescriptionE = "Enemy force received some reinforcements. Today you have to go to the battlefield and stop the enemy troops. Good luck !";
	wcmissiontarget = "The battle is here !";

	_position = [wcmaptopright, wcmapbottomleft, "onflat"] call WC_fnc_createposition;
	wcbattlefieldfinish = false;

	_nearestCity = nearestLocation [_position, "NameLocal"];
	wcmissionname = "Battle in region of " + text _nearestCity;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "battlefield";
	_markersize = 500;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	sleep 10;
	
	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trg setTriggerActivation["EAST","NOT PRESENT", false];
	_trg setTriggerStatements["this or count thislist < 3", "
		wcbattlefieldfinish = true;
	", ""];

	_missionend = false;
	while { !_missionend } do {
		if(wcbattlefieldfinish) then {
			nil = [nil,nil,rHINT,'Battlefied is clear'] call RE;
			wcmissionokW = [0,true];
			publicvariable 'wcmissionokW';
			wcmissionokW = [0, false];
			publicvariable 'wcmissionokE';
			wcmissionclear = true;
			wcscore = 10;
			_missionend = true;
		};
		sleep 60;
	};

	deletevehicle _trg;