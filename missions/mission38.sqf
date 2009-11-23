	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_trg", "_marker", "_missionnumber", "_list"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Wood factory";
	wcmissiondescriptionW = "There is an important wood industry in the north of Tchernarus. Just destroy it";
	wcmissiondescriptionE = "Take a rest at the base of Tchernarus.";
	wcmissiontarget = "Wood factory";
	_missionnumber = 38;

	_objectid = 19692;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_marker = ['woodfactory', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'woodfactory'] call WC_fnc_createmarker;

	_markername = "woodzone";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	_position = [2094,12810];
	_target = "smallbase";
	_target = [_target, 180, _position] call EXT_fnc_createcomposition;

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if (getDammage _object > 0.5) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Wood factory has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
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

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);