	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_missionnumber"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Propaganda ... ";
	wcmissiondescriptionW = "There is too much enemy in Kranostav, destroy them";
	wcmissiondescriptionE = "A new US propaganda is display on our street. You must destroy it!";
	wcmissiontarget = "Propaganda";
	_missionnumber = 36;
	_objectid = 971728;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	_object setdamage 0.4;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "propaganda";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	nil = ['propaganda', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'propaganda'] call WC_fnc_createmarker;

	_counter = 0;
	_missionend = false;
	while { !_missionend } do {
		if (getDammage _object > 0.5) then {
			wcmissionokW = [_missionnumber, false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber, true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Propaganda has been destroyed.'] call RE;
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