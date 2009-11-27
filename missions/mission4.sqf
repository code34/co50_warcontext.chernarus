	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_missionend", "_vehicle", "_destinationposition", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Cocaine";
	wcmissiondescriptionW = "A traficant of drugs takes advantage of the current chaos to cross the country, we are not going to let them make! A filled truck is on the way, we are going to intercept it and to make a barbecue.";
	wcmissiondescriptionE = "A friend is the US Target. He's crossing quietly the country in his truck, try to escort him silency";
	wcmissiontarget = "HeavenTruck";
	_missionnumber = 4;
	
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
	_vehicle lock true;
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

	_counter = 0;
	_missionend = false;
	while { !_missionend } do {
		if (_vehicle distance _destinationposition < 200) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! Truck reach its destination'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (!alive _vehicle or (getdammage _vehicle) > 0.8) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: West wins ! Truck has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late! mission is finished'] call RE;
			wcmissionokE = [_missionnumber, true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber, false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};		
		sleep 60;
		_counter = _counter + 1;
	};

	sleep 120;
	_dummyunit setdammage 1;
	_dummyunit2 setdammage 1;
	_dummyunit3 setdammage 1;
	deletevehicle _vehicle;
	deletevehicle _dummyunit;
	deletevehicle _dummyunit2;
	deletevehicle _dummyunit3;