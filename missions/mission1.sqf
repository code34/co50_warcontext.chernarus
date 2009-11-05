	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CONVOY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_john", "_destinationposition", "_missionend"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "To cook John";
	wcmissiondescription = "Today we works on the John case. John is a very special chimist on the way to Patria. You have to intercept and kill him. We know from safe source that he has a rendez-vous.";
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
	nil = [_markername, _markersize, _destinationposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_group = createGroup east;
	_dummyvehicle = createVehicle ["Ikarus", _sourceposition, [], 0, "NONE"];
	_dummyunit = _group createUnit ["RUS_Soldier1", _sourceposition, [], 0, "FORM"];
	_john = _group createUnit ["Assistant", _sourceposition, [], 0, "FORM"];
	_dummyunit assignAsDriver _dummyvehicle;
	_john assignAsCargo _dummyvehicle;
	_dummyunit moveindriver _dummyvehicle;
	_john moveincargo _dummyvehicle;
	_dummyunit commandMove _destinationposition;
	_john commandMove _destinationposition;
	[_john, "john", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Kill John'] spawn WC_fnc_attachmarker;

	_missionend = false;
	while { !_missionend } do {
		if(((position _john) distance _destinationposition) < 500) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed.'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if(!alive _john) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'John is dead.'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = 10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		sleep 4;
	};