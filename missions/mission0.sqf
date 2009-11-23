	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CLEAR ZONE
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_group", "_counter", "_missionnumber"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissiondescriptionW = "Enemy force received some reinforcements. Today you have to go to the battlefield and stop the enemy troops. Good luck !";
	wcmissiondescriptionE = "Enemy force received some reinforcements. Today you have to go to the battlefield and stop the enemy troops. Good luck !";
	wcmissiontarget = "The battle is here !";
	_missionnumber = 0;

	_position = [wcmaptopright, wcmapbottomleft, "onflat"] call WC_fnc_createposition;
	wcbattlefieldfinish = false;

	_nearestCity = nearestLocation [_position, "NameLocal"];
	wcmissionname = "Battle in region of " + text _nearestCity;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "battlefield";
	_markersize = 500;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	_group = [_markername] call WC_fnc_randomizegroup;

	sleep 10;
	
	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trg setTriggerActivation["EAST","NOT PRESENT", false];
	_trg setTriggerStatements["this or count thislist < 3", "
		wcbattlefieldfinish = true;
	", ""];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wcbattlefieldfinish) then {
			nil = [nil,nil,rHINT,'Battlefied is clear'] call RE;
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber, false];
			publicvariable 'wcmissionokE';
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'East wins ! Too late! Battlefied is finished'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcscore = 10;
			wcmissionclear = true;
			_missionend = true;
		};
		sleep 60;
	};

	deletevehicle _trg;

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);