// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: 
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Garage";
	wcmissiondescription = "The Russians use the marshalling yard of Tchernogorsk as garage to repair their vehicles. We are going to deprive them this resource.";
	wcmissiontarget = "Mecanich";
	_objectid = 970310;
	
	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
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
	nil = [_markername, true] call WC_fnc_randomizegroup;
	
	_object addeventhandler ['killed', {
		nil = [nil,nil,rHINT,'Mission success'] call RE;
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		wcmissionclear = true;
	}];