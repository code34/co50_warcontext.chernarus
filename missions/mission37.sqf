	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber", "_list"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Take over airport";
	wcmissiondescriptionW = "We need a new airport base. A good place can be the north of tchernarus";
	wcmissiondescriptionE = "We need a new airport base. A good place can be the north of tchernarus";
	wcmissiontarget = "Airport";
	_missionnumber = 37;

	_objectid = 94933;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_marker = ['airport', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'airport tower'] call WC_fnc_createmarker;

	wcobject = false;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["ANY","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcobject = true;
	"", """"];", wclevel];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(wcobject) then {
			_list = list _trg;
			if (west countside _list > east countside _list) then {
				nil = [nil,nil,rHINT,'Side mission: West wins ! A new airport base has been construct!'] call RE;
				wcmissionokE = [_missionnumber,false];
				publicvariable 'wcmissionokE';
				wcmissionokW = [_missionnumber,true];
				publicvariable 'wcmissionokW';
				wcscore = 10;
				nil = [wcscore, wcside] spawn WC_fnc_score;
				wcmissionclear = true;
				_missionend = true;
				_position = [12007,12680];
				_plane = "AV8B2" createVehicle _position;
			} else {
				nil = [nil,nil,rHINT,'Side mission: East wins ! A new airport base has been construct!'] call RE;
				wcmissionokE = [_missionnumber,true];
				publicvariable 'wcmissionokE';
				wcmissionokW = [_missionnumber,false];
				publicvariable 'wcmissionokW';
				wcscore = 10;
				nil = [wcscore, wcenemyside] spawn WC_fnc_score;
				wcmissionclear = true;
				_missionend = true;
				_position = [12007,12680];
				_plane = "Su34" createVehicle _position;
			};
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late'] call RE;
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