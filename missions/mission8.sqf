	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SECURE
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [ "_sourceposition", "_destinationposition", "_marker", "_markername", "_markersize", "_vehicle", "_missionend","_planeposition", "_array", "_tunguska1", "_tunguska2", "_tunguska3", "_pilot", "_group", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Flying bears";
	wcmissiondescriptionW = "We are at the moment the only allied Forces on zone. The teams Panda et Kodiak will soon be parachuted. We have to make sure that they can make it safely. The dropzone must be clean.";
	wcmissiondescriptionE = "Enemy send regulary airplane over our zone. We must destroy them!";
	wcmissiontarget = "Dropzone";
	_missionnumber = 8;

	_timemax = 1800;

	_destinationposition = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	wcmissionposition = _destinationposition;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "dropzone";
	_markersize = 1000;
	_marker = [_markername, _markersize, _destinationposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	nil = [_markername] call WC_fnc_randomizegroup;

	_position = [_markername, "onmountain"] call WC_fnc_createpositioninmarker;
	_array1 = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	_tunguska1 = _array1 select 0;
	[_tunguska1, 'tung1', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'tung1'] spawn WC_fnc_attachmarker;
	
	_position = [_markername, "onmountain"] call WC_fnc_createpositioninmarker;
	_array2 =[_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	_tunguska2 = _array2 select 0;
	[_tunguska2, 'tung2', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'tung2'] spawn WC_fnc_attachmarker;

	_position = [_markername, "onmountain"] call WC_fnc_createpositioninmarker;
	_array3 =[_position, 0, "ZSU_INS", east] call BIS_fnc_spawnVehicle;
	_tunguska3 = _array3 select 0;
	[_tunguska3, 'tung3', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'tung3'] spawn WC_fnc_attachmarker;

	_waittotimer = [_timemax, "Time before Airdrop:"] call WC_fnc_createtimer;

	_planeposition = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_units = ["USMC_Soldier", "USMC_Soldier", "USMC_Soldier", "USMC_Soldier", "USMC_Soldier", "USMC_Soldier", "USMC_Soldier", "USMC_Soldier"];
	_group = [_planeposition, west, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	
	_array = [[_planeposition select 0, _planeposition select 1, 300], 0, "C130J", west] call BIS_fnc_spawnVehicle;
	_vehicle = _array select 0;
	_pilot = (_array select 1) select 0;
	_vehicle flyInHeight 200;

	[_vehicle, 'C130', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'C130'] spawn WC_fnc_attachmarker;

	{
		_x moveincargo _vehicle;
	}foreach (units _group);

	[_vehicle] spawn EXT_fnc_vftcas;

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if (count (units _group) < 8) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber, true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins ! A team member has been kill.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (!alive _vehicle or (getdammage _vehicle) > 0.8) then {
			wcmissionokE = [_missionnumber, true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			nil = [nil,nil,rHINT,'Side mission: East wins ! C130 has been destroyed.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if ((leader _group) distance _destinationposition < 500 && (getposatl (leader _group)) select 2 < 5 ) then {
			wcmissionokE = [_missionnumber, false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			nil = [nil,nil,rHINT,'Side mission: West wins ! West has joined destination point.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (!alive _tunguska1 && !alive _tunguska2 && !alive _tunguska3) then {
			_vehicle allowdamage false;
		} else {
			_tunguska1 dofire _vehicle;
			_tunguska2 dofire _vehicle;
			_tunguska3 dofire _vehicle;
		};
		if ([(position _vehicle) select 0, (position _vehicle) select 1] distance _destinationposition > _markersize) then {
			_pilot doMove _destinationposition;
		} else {
			{
				_x action ["eject", _vehicle];
			} foreach (units _group);
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
		_counter = _counter + 1;
		sleep 4;
	};