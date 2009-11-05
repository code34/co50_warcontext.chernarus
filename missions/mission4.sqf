	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_vehicle", "_destinationposition"];

	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Cocaine";
	wcmissiondescription = "A traficant of drugs takes advantage of the current chaos to cross the country, we are not going to let them make! A filled truck is on the way, we are going to intercept it and to make a barbecue.";
	wcmissiontarget = "HeavenTruck";
	
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destinationposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;

	_position = _destinationposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;
	
	_markersize = 500;
	_markername = "destinationposition";
	_position = _destinationposition;
	nil = [_markername, _markersize, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_vehicle = createVehicle ["UralCivil", _sourceposition, [], 0, "NONE"];
	_group = createGroup east;
	_dummyunit = _group createUnit ["Ins_Lopotev", _sourceposition, [], 0, "FORM"];
	_dummyunit2 = _group createUnit ["Ins_Woodlander3", _sourceposition, [], 0, "FORM"];
	_dummyunit3 = _group createUnit ["Ins_Worker2", _sourceposition, [], 0, "FORM"];
	_dummyunit assignAsDriver _vehicle;
	_dummyunit2 assignAsCargo _vehicle;
	_dummyunit3 assignAsCargo _vehicle;
	_dummyunit moveindriver _vehicle;
	_dummyunit2 moveincargo _vehicle;
	_dummyunit3 moveincargo _vehicle;
	_dummyunit commandMove _destinationposition;
	_dummyunit2 commandMove _destinationposition;
	_dummyunit3 commandMove _destinationposition;
	nil = [_dummyunit, wcskill] spawn WC_fnc_setskill;
	nil = [_dummyunit2, wcskill] spawn WC_fnc_setskill;
	nil = [_dummyunit3, wcskill] spawn WC_fnc_setskill;
	[_vehicle, "Truck", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Truck'] spawn WC_fnc_attachmarker;

	_missionend = false;
	while { !_missionend } do {
		if (_vehicle distance _destinationposition < 200) then {
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
		if (!alive _vehicle or (getdammage _vehicle) > 0.8) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'Truck has been destroyed. Mission success.'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = 10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		sleep 4;
	};