	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_target"];
	
	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Buzz of fly";
	wcmissiondescriptionW = "The Russians still have shoots down one of our chopper. That is enough! We just receive orders to destroy the RADAR site responsible for this slaughter";
	wcmissiondescriptionE = "A strategic Radar permits us to keep the advantage on enemy force. They will try to destroy it!";
	wcmissiontarget = "Radar";
	
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
	while { !_missionend } do {
		if (getdammage _target > 0.8) then {
			wcmissionokW = [9,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [9,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Radar has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			_missionend = true;
		};
		sleep 60;
	};