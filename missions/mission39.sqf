	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber", "_list", "_lastposition", "_lastdir"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Near the base";
	wcmissiondescriptionW = "Protect one of our new base";
	wcmissiondescriptionE = "We know about an US activites near the base. Go to looking what happens.";
	wcmissiontarget = "Near the base";
	_missionnumber = 39;

	_position = [7535.78,14179.6,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_lastposition = getpos WBASE_MOBILE;
	_lastdir = getdir WBASE_MOBILE;

	WBASE_MOBILE setpos _position;

	_marker = ['somewhere', 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'somewhere'] call WC_fnc_createmarker;

	_markername = "enemybase";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	_target = "smallbase";
	_target = [_target, 180, _position] call EXT_fnc_createcomposition;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["WEST","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcobject = true;
	"", """"];", wclevel];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wcobject) then {
			_list = list _trg;
			if (west countside _list == 0) then {
				nil = [nil,nil,rHINT,'West base has been destroyed !'] call RE;
				wcmissionokE = [_missionnumber, true];
				publicvariable 'wcmissionokE';
				wcmissionokW = [_missionnumber, false];
				publicvariable 'wcmissionokW';
				wcscore = 10;
				nil = [wcscore, wcenemyside] spawn WC_fnc_score;
				wcmissionclear = true;
				_missionend = true;
			};
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Too late. East wins'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};

	WBASE_MOBILE setpos _lastposition;
	WBASE_MOBILE setdir _lastdir;