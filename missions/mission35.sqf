	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber", "_list"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Found Medics";
	wcmissiondescriptionW = "We need medics for the civilians of Tchernarus. We know about an old stock unused in a little house. Found it!";
	wcmissiondescriptionE = "We need medics for the civilians of Tchernarus. We know about an old stock unused in a little house. Found it!";
	wcmissiontarget = "Found Medics";
	_missionnumber = 35;

	_objectid = 85217;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_marker = ['medics', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'medics'] call WC_fnc_createmarker;

	_markername = "medicszone";
	_markersize = 300;
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	_group = [_marker] call WC_fnc_randomizegroup;	

	wcobject = false;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["ANY","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcobject = true;
	"", """"];", wclevel];

	player setpos _position;

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wcobject) then {
			_list = list _trg;
			if (west countside _list > east countside _list) then {
				nil = [nil,nil,rHINT,'Medics has been found by west !'] call RE;
				wcmissionokE = [_missionnumber,false];
				publicvariable 'wcmissionokE';
				wcmissionokW = [_missionnumber,true];
				publicvariable 'wcmissionokW';
				wcscore = 10;
				nil = [wcscore, wcside] spawn WC_fnc_score;
				wcmissionclear = true;
				_missionend = true;
			} else {
				nil = [nil,nil,rHINT,'Medics has been found by east !'] call RE;
				wcmissionokE = [_missionnumber,true];
				publicvariable 'wcmissionokE';
				wcmissionokW = [_missionnumber,false];
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

	deletevehicle _trg;

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);