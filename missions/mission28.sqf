	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object", "_missionend", "_counter", "_missionnumber"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Crazy Meteo ... ";
	wcmissiondescriptionW = "A meteo station serves to do some scientificals experiments on meteo climat modification. You must destroy it";
	wcmissiondescriptionE = "Our meteo station seems to be since few days the target of few enemy incursions. You must guard and protect it";
	wcmissiontarget = "Crazy Meteo";
	_objectid = 245178;
	_missionnumber = 28;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	_object setdamage 0.4;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "crazymeteo";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	nil = ['meteostation', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Meteo Station'] call WC_fnc_createmarker;

	_counter = 0;
	_missionend = false;
	while { !_missionend } do {
		if (getDammage _object > 0.5) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'West wins. Meteo Station has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Too late. East wins!'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};

	true;