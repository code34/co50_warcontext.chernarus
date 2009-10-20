// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: CAPTURE
// -----------------------------------------------
	private ["_locations", "_veh", "_driver", "_position"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Robin hood";
	wcmissiondescription = "Civilians require food resources. We currently have no support but a smuggling truck was detected by our satellites. We must capture it and bring it to a point that supporters have provided.";
	wcmissiontarget = "Smuggling";

	_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_locations = nearestLocations [_position, ["NameCityCapital", "NameCity","NameVillage", "Name"], 5000];

	_array = [_position, 0, 'UralCivil', east] call BIS_fnc_spawnVehicle;
	_veh = _array select 0;
	_driver = (_array select 1) select 0;
	[_veh, "Foodtruck", 1, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , 'Foodtruck'] spawn WC_fnc_attachmarker;

	_destinationposition = [wcmaptopright, wcmapbottomleft, "notinforest"] call WC_fnc_createposition;
	_markername ="Delivery";
	_markersize = 300;
	nil = [_markername, _markersize, _destinationposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_veh addeventhandler ['killed', {
		wcfail = true; 
		publicvariable 'wcfail'; 
		wcfail = false;
		nil = [nil,nil,rHINT,'Mission Failed.'] call RE;
		wcmissionclear = true;
	}];

	while {(_driver in _veh)} do {
		_location = _locations call BIS_fnc_selectRandom;
		_position = position _location;
		_driver commandMove _position;
		waituntil {(_veh distance _position < 50)};
	};
	

	waituntil {(_veh distance _destinationposition < 50)};

	if (!alive _veh) then {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Well done, Food is delivered!'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	 };