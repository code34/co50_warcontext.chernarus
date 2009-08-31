// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: 
// -----------------------------------------------

	wcmissionauthor ="=[A*C]= code34";
	wcmissiondescription = "Today it is your turn. Your squad had been assigned to patrol in friendly citie. 
	There is no particular goal: watch and inform us immediatly if something happens. No enemy had been detected in this area since a long time.";
	wcmissiontarget = "";

	_townposition = [wcmaptopright, wcmapbottomleft, "invillage"] call WC_fnc_createposition;

	// _marker = ["townposition", 1, _townposition, "ColorBlue", "ICON", "FDIAGONAL", "FLAG", direction player, ""] call WC_fnc_createmarker;

	_nearestCity = nearestLocation [_townposition, "NameVillage"];
	wcmissionname = "On guard at " + text _nearestCity;

	wcmissionposition = _townposition;
	
	_position = [0,0,0];
	while { _townposition distance _position > 1000 } do {
		hint format["%1", _position];
		_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	};

	_tunguska1 = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	[_tunguska1 select 0, "tung1", 1 , "" , "ICON", "" , 2, "WARNING", direction (_tunguska1 select 0), "AA"] spawn WC_fnc_attachmarker;
	(_tunguska1 select 1) commandMove _townposition;

	nil = [] spawn WC_fnc_publishmission;

	player setpos _townposition;