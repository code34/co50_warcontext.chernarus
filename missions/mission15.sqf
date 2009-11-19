	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CAPTURE
	// -----------------------------------------------
	private ["_locations", "_vehicle", "_driver", "_position", "_counter", "_missionend", "_destinationposition", "_lastposition", "_nextposition", "_markername", "_markersize"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Robin hood";
	wcmissiondescriptionW = "Civilians require food resources. We currently have no support but a smuggling truck was detected by our satellites. We must capture it and bring it to a point that supporters have provided.";
	wcmissiondescriptionE = "A food truck is on the way to our base";
	wcmissiontarget = "Delivery Destination";

	_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destinationposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
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


	[_vehicle, "Foodtruck", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Capture Foodtruck'] spawn WC_fnc_attachmarker;

	_markername ="Delivery";
	_markersize = 300;
	nil = [_markername, _markersize, _destinationposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_counter = 0;
	_missionend = false;
	_lastposition = [0,0,0];
	while { !_missionend } do {
		if((_vehicle distance _destinationposition) < _markersize) then {
			wcmissionokW = [15,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [15,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Well done, Food is delivered!'] call RE;
			wcscore = 10;
			wcmissionclear = true;
			_missionend = true;
		};
		if((_vehicle distance _nextposition) < 500) then {
			_location = _locations call BIS_fnc_selectRandom;
			_nextposition = position _location;
			_driver doMove _nextposition;			
		};
		if(!alive _driver) then {
			wcmissionokW = [15,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [15,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Mission Failed. Who ask you to kill civil ?'] call RE;
			wcmissionclear = true;
			wcscore = -10;
			_missionend = true;
		};
		if (getdammage _vehicle> 0.79 or !alive _vehicle) then {
			wcmissionokW = [15,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [15,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Mission Failed. Truck has been destroyed'] call RE;
			wcmissionclear = true;
			wcscore = -10;
			_missionend = true;
		};
		if (_counter > 30) then {
			wcmissionokW = [15,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [15,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Mission Failed. All foods has been delivered'] call RE;
			wcmissionclear = true;
			wcscore = -10;
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