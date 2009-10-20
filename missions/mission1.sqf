	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CONVOY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionauthor = "code34";
	wcmissionname = "To cook John";
	wcmissiondescription = "Today you have to cook John. John is a scientist on the way to Patria. You have to intercept and kill him. From safe source we know that John is at the moment <marker name='john'>here</marker>, he has a rendez-vous <marker name='destinationposition'>here</marker>.";
	wcmissiontarget = "John is around here !";

	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destinationposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	while { (_sourceposition distance _destinationposition < 4000) } do {
		_destinationposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	};

	wcmissionposition = _sourceposition;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 500;
	_markername = "destinationposition";
	nil = [_markername, _markersize, _destinationposition, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_group = createGroup east;
	_dummyvehicle = createVehicle ["Ikarus", _sourceposition, [], 0, "NONE"];
	_dummyunit = _group createUnit ["RUS_Soldier1", _sourceposition, [], 0, "FORM"];
	_dummyunit2 = _group createUnit ["Assistant", _sourceposition, [], 0, "FORM"];
	_dummyunit assignAsDriver _dummyvehicle;
	_dummyunit2 assignAsCargo _dummyvehicle;
	_dummyunit moveindriver _dummyvehicle;
	_dummyunit2 moveincargo _dummyvehicle;
	_dummyunit commandMove _destinationposition;
	_dummyunit2 commandMove _destinationposition;
	[_dummyunit2, "john", 1, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , 'john'] spawn WC_fnc_attachmarker;

	_dummyunit2 addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'John is dead.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];
	
	_trg=createTrigger["EmptyDetector", _destinationposition]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcfail = true; 
		publicvariable 'wcfail'; 
		wcfail = false;
		nil = [nil,nil,rHINT,'Mission Failed.'] call RE;
		wcmissionok = false;
		wcmissionclear = true;
	"", """"];", wclevel];