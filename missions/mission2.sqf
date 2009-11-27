	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_missionnumber"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Chemical hazard ... ";
	wcmissiondescriptionW = "A hangar stocks some dangerous products. You must destroy it";
	wcmissiondescriptionE = "A hangar stocks some dangerous products and will be destroy by US ARMY, you must protect it";
	wcmissiontarget = "Chemical zone";
	_missionnumber = 2;
	_objectid = 172934;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	_object setdamage 0.4;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "chemicalhazard";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	nil = ['hangar', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Destroy Hangar'] call WC_fnc_createmarker;

	_counter = 0;
	_missionend = false;
	while { !_missionend } do {
		if (getDammage _object > 0.5) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: West wins ! Hangar has been destroyed.'] call RE;
			_missionend = true;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
		};
		if(_counter > 30) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late'] call RE;
			_missionend = true;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
		};
		_counter = _counter + 1;
		sleep 60;
	};