// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Cocaine";
	wcmissiondescription = "Des traficants de drogue profitent du chaos actuel pour traverser le pays,on va pas laisser faire! Un camion rempli est en route,on va l'intercepter et faire un bbq.";
	wcmissiontarget = "HeavenTruck";
	
	_source_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destination_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;

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
	
	_dummyvehicle = createVehicle ["UralCivil", _source_position, [], 0, "NONE"];
	_group = createGroup east;
	_dummyunit = _group createUnit ["Ins_Lopotev", _source_position, [], 0, "FORM"];
	_dummyunit2 = _group createUnit ["Ins_Woodlander3", _source_position, [], 0, "FORM"];
	_dummyunit3 = _group createUnit ["Ins_Worker2", _source_position, [], 0, "FORM"];
	_dummyunit assignAsDriver _dummyvehicle;
	_dummyunit2 assignAsCargo _dummyvehicle;
	_dummyunit3 assignAsCargo _dummyvehicle;
	_dummyunit moveindriver _dummyvehicle;
	_dummyunit2 moveincargo _dummyvehicle;
	_dummyunit3 moveincargo _dummyvehicle;
	_dummyunit commandMove _destination_position;
	_dummyunit2 commandMove _destination_position;
	_dummyunit3 commandMove _destination_position;
	nil = [_dummyunit, wcskill] spawn WC_fnc_setskill;
	nil = [_dummyunit2, wcskill] spawn WC_fnc_setskill;
	nil = [_dummyunit3, wcskill] spawn WC_fnc_setskill;
	[_dummyvehicle, "camion", 1, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , 'camion'] spawn WC_fnc_attachmarker;

	_dummyvehicle addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Mission success.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];
	
	_trg = createTrigger["EmptyDetector", _destination_position]; 
	_trg setTriggerArea[50,50,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcfail = true; 
		publicvariable 'wcfail'; 
		wcfail = false;
		nil = [nil,nil,rHINT,'Mission Failed.'] call RE;
		wcmissionok = false;
		wcmissionclear = true;
	"", """"];", wclevel];	