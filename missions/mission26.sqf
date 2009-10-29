	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------

	wcmissionauthor = "=[A*C]= Lueti";
	wcmissionname = "Free frequency";
	wcmissiondescription = "A regional radio, controlled by the Russians, harangue the population against the American strengths. It is necessary to destroy this propaganda object.";
	wcmissiontarget = "Radio tower";

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 100;
	_markername = "sourceposition";
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ICON', 'FDIAGONAL', 'EMPTY'] call WC_fnc_createmarker;

	_radiotower = createVehicle ["Land_Antenna", _position, [], 0, "NONE"];
	_object = createVehicle ["PowGen_Big", [_position select 0, (_position select 1) + 30], [], 0, "NONE"];
	[_radiotower, "Radio tower", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Radio tower'] spawn WC_fnc_attachmarker;

	_radiotower addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Radio Tower has been destroyed.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];