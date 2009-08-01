// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: CONVOY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor = "code34";
	wcmissionname = "To cook John";
	wcmissiondescription = "Today you have to cook John. John is a scientist on the way to Patria. You have to intercept and kill him";
	wcmissiontarget = "John is around here !";

	_source_position = [wcmaptopright, wcmapbottomleft] call func_createpositiononroad;
	_destination_position = [wcmaptopright, wcmapbottomleft] call func_createpositiononroad;
	_position = _source_position;	
	wcmissionposition = _position;

	_markersize = 500;
	_markername = "sourceposition";
	_position = _source_position;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call func_createmarker;

	_markersize = 500;
	_markername = "destinationposition";
	_position = _destination_position;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call func_createmarker;
	
	dummyvehicle = createVehicle ["Ikarus", _source_position, [], 0, "NONE"];
	_group = createGroup east;

	dummyunit = _group createUnit ["RUS_Soldier1", _source_position, [], 0, "FORM"];
	dummyunit2 = _group createUnit ["Assistant", _source_position, [], 0, "FORM"];
	dummyunit assignAsDriver dummyvehicle;
	dummyunit2 assignAsCargo dummyvehicle;
	dummyunit moveindriver dummyvehicle;
	dummyunit2 moveincargo dummyvehicle;
	dummyunit commandMove _destination_position;
	dummyunit2 commandMove _destination_position;

	dummyunit2 addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		deletemarker sourceposition;
		deletemarker destinationposition;
		wcmissionclear = true;
		deletevehicle trgintro;
		deletevehicle _this;
	}];
	
	_trg=createTrigger["EmptyDetector", _destination_position]; 
	_trg setTriggerArea[50,50,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		task%1 settaskstate 'Failed';
		deletemarker sourceposition;
		deletemarker destinationposition;
		wcmissionclear = true;
		deletevehicle trgintro;
		deletevehicle _this;
	"", """"];", wclevel];