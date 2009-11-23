	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "The proof";
	wcmissiondescriptionW = "An industrial do some strange traitement to build some pieces for nuclear activities. Find some proof into the garbage.";
	wcmissiondescriptionE = "There is an important industrial in this zone, that build pieces for our nuclear activities. You must take care of its industries";
	wcmissiontarget = "Industrial";
	_missionnumber = 30;

	_objectid = 997435;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_marker = ['garbage', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'well'] call WC_fnc_createmarker;

	_markername = "garbagezone";
	_markersize = 300;
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	_group = [_marker] call WC_fnc_randomizegroup;	

	wcobject = false;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["West","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcobject = true;
	"", """"];", wclevel];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wcobject) then {
			nil = [nil,nil,rHINT,'West wins, found the informations !'] call RE;
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
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

	deletevehicle _trg;

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);