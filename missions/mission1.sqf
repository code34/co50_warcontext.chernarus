	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CONVOY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_john", "_destinationposition", "_missionend", "_missionnumber"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "To cook John";
	wcmissiondescriptionW = "Today we works on the John case. John is a very special chimist on the way to Patria. You have to intercept and kill him. We know from safe source that he has a rendez-vous.";
	wcmissiondescriptionE = "A drug expert will work for us, you must escort it to its rendez-vous point";
	wcmissiontarget = "John is around here !";
	_missionnumber = 1;

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
	_dummyvehicle lock true;
	_dummyunit = _group createUnit ["RUS_Soldier1", _sourceposition, [], 0, "FORM"];
	_john = _group createUnit ["Assistant", _sourceposition, [], 0, "FORM"];
	_dummyunit assignAsDriver _dummyvehicle;
	_john assignAsCargo _dummyvehicle;
	_dummyunit moveindriver _dummyvehicle;
	_john moveincargo _dummyvehicle;
	_dummyunit commandMove _destinationposition;
	_john commandMove _destinationposition;
	[_john, "john", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'John'] spawn WC_fnc_attachmarker;

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if(((position _john) distance _destinationposition) < 500) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! John arrive to his destination'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(!alive _john) then {
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			nil = [nil,nil,rHINT,'Side mission: West wins ! John is dead.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late!'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
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
	deletevehicle _dummyvehicle;
	_dummyunit setdammage 1;
	deletevehicle _dummyunit;