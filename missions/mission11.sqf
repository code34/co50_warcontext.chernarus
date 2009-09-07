// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Centipede";
	wcmissiondescription = "An enemy convoy transport the equipment to build new military installations. We know about sure source that if this material is destroyed, it will be very difficult to replace it. Satellite pictures allowed us to localize the convoy. Strike fast and strong.";
	wcmissiontarget = "vehicles";
	
	_source_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destination_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createpositionon;

	_position = _source_position;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;
	
	_markersize = 500;
	_markername = "sourceposition";
	_position = _source_position;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_markersize = 500;
	_markername = "destinationposition";
	_position = _destination_position;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_grad = [_position, 0, "GRAD_RU", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;
	
	_kamazr = [_position, 0, "KamazRepair", east] call BIS_fnc_spawnVehicle;
	_crew = _kamazr select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;
	
	_kamaz = [_position, 0, "Kamaz", east] call BIS_fnc_spawnVehicle;
	_crew = _kamaz select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;
	
	_btr = [_position, 0, "BTR90", east] call BIS_fnc_spawnVehicle;
	_crew = _btr select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;
	
	_uazags = [_position, 0, "UAZ_AGS30_RU", east] call BIS_fnc_spawnVehicle;
	_crew = _uazags select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;
	
	_kamazmun = [_position, 0, "KamazReammo", east] call BIS_fnc_spawnVehicle;
	_crew = _kamazmun select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;
	
	_convoi= [_grad,_kamazr,_kamaz,_btr,_uazags,_kamazmun];
	_convoi setFormation 'COLUMN";
	_convoi setSpeedMode "LIMITED";

	player moveincargo _kamaz;
	
	_convoi addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		deletemarker sourceposition;
		deletemarker destinationposition;
		wcmissionclear = true;
		deletevehicle _trgintro;
		deletevehicle _this;
	}];
	
	_trg = createTrigger["EmptyDetector", _destination_position]; 
	_trg setTriggerArea[50,50,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		task%1 settaskstate 'Failed';
		deletemarker sourceposition;
		deletemarker destinationposition;
		wcmissionclear = true;
		deletevehicle _trgintro;
		deletevehicle _this;
	"", """"];", wclevel];