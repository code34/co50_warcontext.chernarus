	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CAPTURE
	// -----------------------------------------------
	private ["_locations", "_vehicle", "_driver", "_position", "_counter", "_missionend", "_destinationposition", "_lastposition", "_nextposition", "_markername", "_markersize"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Robin hood";
	wcmissiondescription = "Civilians require food resources. We currently have no support but a smuggling truck was detected by our satellites. We must capture it and bring it to a point that supporters have provided.";
	wcmissiontarget = "Smuggling";

	_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destinationposition = [wcmaptopright, wcmapbottomleft, "notinforest"] call WC_fnc_createposition;
	_locations = nearestLocations [_position, ["NameCityCapital", "NameCity","NameVillage", "Name"], 1000];

	wcmissionposition = _destinationposition;
	nil = [] spawn WC_fnc_publishmission;

	_array = [_position, 0, 'UralCivil', east] call BIS_fnc_spawnVehicle;
	_vehicle = _array select 0;
	_driver = (_array select 1) select 0;
	_location = _locations call BIS_fnc_selectRandom;
	_nextposition = position _location;
	_driver doMove _nextposition;	
	_driver allowfleeing 1;


	[_vehicle, "Foodtruck", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Foodtruck'] spawn WC_fnc_attachmarker;

	_markername ="Delivery";
	_markersize = 300;
	nil = [_markername, _markersize, _destinationposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_counter = 0;
	_missionend = false;
	_lastposition = [0,0,0];
	while { !_missionend } do {
		if((_vehicle distance _destinationposition) < 500) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'Well done, Food is delivered!'] call RE;
			wcmissionok = true;
			wcscore = 10;
			publicvariable 'wcscore';
			wcmissionclear = true;
		};
		if((_vehicle distance _nextposition) < 500) then {
			_location = _locations call BIS_fnc_selectRandom;
			_nextposition = position _location;
			_driver doMove _nextposition;			
		};
		if(!alive _driver) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. Who ask you to kill civil ?'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if (getdammage _vehicle> 0.79 or !alive _vehicle) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. Truck has been destroyed'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if (_counter > 30) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. All foods has been delivered'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			wcscore = -10;
			publicvariable 'wcscore';
			_missionend = true;
		};
		if ((position _vehicle) distance _lastposition < 10) then {
			_vehicle setpos [(((position _vehicle) select 0) + 5),  ((position _vehicle) select 1)];
			_driver assignAsDriver _vehicle;
			_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
			_driver doMove _position;
		};
		_lastposition = position _vehicle;
		_counter = _counter + 1;
		sleep 60;
	};