	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber", "_unit", "_group", "_list", "_position"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Bad work";
	wcmissiondescriptionW = "An industry director will be arrest. He knows strategic and confidiential informations. Kill him";
	wcmissiondescriptionE = "You have to arrest an industry director and bring him back to base for interrogation";
	wcmissiontarget = "Director";
	_missionnumber = 42;

	_objectid = 148696;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_marker = ['traitor', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'traitor'] call WC_fnc_createmarker;

	_markername = "directorzone";
	_markersize = 300;
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	_group = [_marker] call WC_fnc_randomizegroup;	

	wcobject = false;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[20,20,0,false];
	_trg setTriggerActivation["East","PRESENT",true];
	_trg setTriggerStatements["this", "wcobject = true;", ""];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wcobject) then {
			wcobject = false;
			_list = list _trg;
			_group = (group(_list select 0));
			deletevehicle _trg;
			_unit = _group createUnit ["RU_Profiteer1", [(_position select 0) - 20, _position select 1], [], 0, "NONE"];
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: West wins ! Too late'] call RE;
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		if (_unit distance EBASE_MOBILE < 100) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Director has been arrested'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		if (!alive _unit) then {
			nil = [nil,nil,rHINT,'Side mission: West wins ! The director has been killed'] call RE;
			wcmissionokE = [_missionnumber, false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber, true];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		sleep 60;
		_counter = _counter + 1;
	};
	deletevehicle _trg;

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);