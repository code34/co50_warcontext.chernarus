	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: 
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private ["_object", "_missionend", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Garage";
	wcmissiondescriptionW = "The Russians use the marshalling yard of Tchernogorsk as garage to repair their vehicles. We are going to deprive them this resource.";
	wcmissiondescriptionE = "One of our garage will be attack by enemy, we must protect it.";
	wcmissiontarget = "Mecanich";
	_objectid = 970175;
	_missionnumber = 6;
	
	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	nil = ['Garage', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Strategic Garage'] call WC_fnc_createmarker;

	_angle = getdir _object;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;
	
	_position1 = [6967,2385,0];
	_generator = createvehicle ["PowGen_Big", _position1, [], 0, "NONE"];
	_generator setdir 315;

	_position2 = [6977,2410,0];
	_brdmwreck = createvehicle ["BRDMWreck", _position2, [], 0, "NONE"];
	_brdmwreck setdir _angle;

	_position3 = [6988,2419,0];
	_t72wreck = createvehicle ["T72Wreck", _position3, [], 0, "NONE"];
	_t72wreck setdir _angle;     

	_position4 = [6979,2413,0];
	_t72WreckTurret = createvehicle ["T72WreckTurret", _position4, [], 0, "NONE"];
	_t72wreckturret setdir _angle;

	_position5 = [6964,2401,0];
	_contenair = createvehicle ["Misc_cargo_cont_net3", _position5, [], 0, "NONE"];
	_contenair setdir _angle;

	_markername = "mechanics_zone";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;
	
	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if (!alive _object or (getdammage _object) > 0.5) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Garage has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Too late ! East win ! mission is finished'] call RE;
			wcmissionokE = [_missionnumber, true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber, false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};