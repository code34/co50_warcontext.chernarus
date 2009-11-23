	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber", "_unit", "_group", "_list", "_position"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Escape at all price";
	wcmissiondescriptionW = "One of our agent escape from prison. You must rescue it";
	wcmissiondescriptionE = "One of our prisonner just escape. Kill HIM !";
	wcmissiontarget = "Prisonner";
	_missionnumber = 32;

	_objectid = 165362;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_marker = ['prisonner', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'prisonner'] call WC_fnc_createmarker;

	_markername = "prisonnerzone";
	_markersize = 300;
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	_group = [_marker] call WC_fnc_randomizegroup;	

	wcobject = false;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[10,10,0,false];
	_trg setTriggerActivation["West","PRESENT",true];
	_trg setTriggerStatements["this", "wcobject = true;", ""];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wcobject) then {
			wcobject = false;
			_list = list _trg;
			_group = (group(_list select 0));
			deletevehicle _trg;
			_unit = _group createUnit ["Citizen1", [(_position select 0) - 20, _position select 1], [], 0, "NONE"];
		};
		if (_unit distance WBASE_MOBILE < 200) then {
			nil = [nil,nil,rHINT,'The prisonner is safe'] call RE;
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		if (!alive _unit) then {
			nil = [nil,nil,rHINT,'The prisonner was killed'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
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