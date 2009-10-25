	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Buzz of fly";
	wcmissiondescription = "The Russians still have shoots down one of our copters. That is enough! We just receive orders to destroy the RADAR site responsible for this slaughter";
	wcmissiontarget = "Radar";
	
	_position = [11478,11346,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 100;
	_markername = "sourceposition";
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY'] call WC_fnc_createmarker;

	_target = createVehicle ["RU_WarfareBArtilleryRadar", _position, [], 0, "NONE"];
	[_target, "Radar", 1, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Radar'] spawn WC_fnc_attachmarker;

	_target addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Radar has been destroyed.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];

	if(random 1 > 0.5) then {
		_position = [_markername] call WC_fnc_createpositioninmarker;
		_dir = random 360;
		_camp = ["camp_ru1", _dir, _position] call EXT_fnc_createcomposition;
	};

	if(random 1 > 0.9) then {
		nil = [_markername] call WC_fnc_randomizegroup;
	};