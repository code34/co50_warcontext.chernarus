// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: 
// -----------------------------------------------
if (!isServer) exitWith{};

	sleep 10;

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Garage";
	wcmissiondescription = "The Russians use the marshalling yard of Tchernogorsk as garage to repair their vehicles. We are going to deprive them this resource.";
	wcmissiontarget = "Mecanich";
	_objectid = 970310;
	
	_object = [_objectid] call func_getobject;
	_position = position _object;
	_angle = getdir _object;
	
	_position1 = [6967,2385,0];
	call compile format ["generator = createvehicle [""PowGen_Big"", %1, [], 0, ""NONE""];", _position1];
	generator setdir 315;
	_position2 = [6977,2410,0];
	call compile format ["brdmwreck = createvehicle [""BRDMWreck"", %1, [], 0, ""NONE""];", _position2];
	brdmwreck setdir _angle;
	_position3 = [6988,2419,0];
	call compile format ["t72wreck = createvehicle [""T72Wreck"", %1, [], 0, ""NONE""];", _position3];
	t72wreck setdir _angle;     
	_position4 = [6979,2413,0];
	call compile format ["T72WreckTurret = createvehicle [""T72WreckTurret"", %1, [], 0, ""NONE""];", _position4];
	t72wreckturret setdir _angle;
	_position5 = [6964,2401,0];
	call compile format ["contenair = createvehicle [""Misc_cargo_cont_net3"", %1, [], 0, ""NONE""];", _position5];
	contenair setdir _angle;

	wcmissionposition = _position;

	_markername = "mechanics_zone";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call func_createmarker;
	
	_object addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		wcmissionclear = true;
		deletemarker _markername;
		deletevehicle trgintro;
	}];
	
	nil = [_markername] call func_randomizegroup;

	delmissiontrg = createTrigger["EmptyDetector",_position]; 
	delmissiontrg setTriggerArea[wctriggersize,wctriggersize,0,false];
	delmissiontrg setTriggerActivation["EAST","PRESENT", TRUE];
	delmissiontrg setTriggerStatements["this && wcmissionclear", "
			{
				_x setdamage 1;
			}foreach thislist;
			deletevehicle this;
			
			", ""];