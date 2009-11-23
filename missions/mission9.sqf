	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_target", "_counter", "_missionnumber"];
	
	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Buzz of fly";
	wcmissiondescriptionW = "The Russians still have shoots down one of our chopper. That is enough! We just receive orders to destroy the RADAR site responsible for this slaughter";
	wcmissiondescriptionE = "A strategic Radar permits us to keep the advantage on enemy force. They will try to destroy it!";
	wcmissiontarget = "Radar";
	_missionnumber = 9;
	
	_position = [11478,11346,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 100;
	_markername = "sourceposition";
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY'] call WC_fnc_createmarker;

	_target = createVehicle ["RU_WarfareBArtilleryRadar", _position, [], 0, "NONE"];
	nil = ['Radar', 0.5, position _target, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Strategic Radar'] call WC_fnc_createmarker;

	_position = [_markername] call WC_fnc_createpositioninmarker;
	_dir = random 360;
	_camp = ["camp_ru1", _dir, _position] call EXT_fnc_createcomposition;

	nil = [_markername] call WC_fnc_randomizegroup;

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if (getdammage _target > 0.8) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Radar has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'East wins ! Too late!'] call RE;
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