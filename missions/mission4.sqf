// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Cocaine";
	wcmissiondescription = "Des traficants de drogue profitent du chaos actuel pour traverser le pays,on va pas laisser faire! 
	                        Un camion rempli est en route,on va l'intercepter et faire un bbq.";
	wcmissiontarget = "HeavenTruck";
	
	_source_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destination_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;

	_position = _source_position;
	wcmissionposition = _position;
	
	_markersize = 500;
	_markername = "sourceposition";
	_position = _source_position;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_markersize = 500;
	_markername = "destinationposition";
	_position = _destination_position;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	dummyvehicle = createVehicle ["Ikarus", _source_position, [], 0, "NONE"];
	_group = createGroup east;

	dummyunit = _group createUnit ["Ins_Lopotev", _source_position, [], 0, "FORM"];
	dummyunit2 = _group createUnit ["Ins_Woodlander3", _source_position, [], 0, "FORM"];
	dummyunit3 = _group createUnit ["Ins_Worker2", _source_position, [], 0, "FORM"];
	dummyunit assignAsDriver dummyvehicle;
	dummyunit2 assignAsCargo dummyvehicle;
	dummyunit3 assignAsCargo dummyvehicle;
	dummyunit moveindriver dummyvehicle;
	dummyunit2 moveincargo dummyvehicle;
	dummyunit3 moveincargo dummyvehicle;
	dummyunit commandMove _destination_position;
	dummyunit2 commandMove _destination_position;
	dummyunit3 commandMove _destination_position;
	nil = [dummyunit, wcskill] spawn WC_fnc_setskill;
	nil = [dummyunit2, wcskill] spawn WC_fnc_setskill;
	nil = [dummyunit3, wcskill] spawn WC_fnc_setskill;

	dummyvehicle addeventhandler ['killed', {
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