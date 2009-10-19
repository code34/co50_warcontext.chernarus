	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Format C:";
	wcmissiondescription = "One of our choppers had his engine out of order and had to land of urgency. Regrettably, its embedded computer contains data relative to the positions of our strengths. It is thus necessary to go to blow up this device.";
	wcmissiontarget = "Mh down";

	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_array =[_position, 0, "MH60S", west] call BIS_fnc_spawnVehicle;
	_chopper = _array select 0;
	_pilot1 = (_array select 1) select 0;
	_pilot2 = (_array select 1) select 1;
	_pilot3 = (_array select 1) select 2;
	_chopper setFuel 0;
	_chopper setdamage 0.4;
	_pilot1 setdamage 1;
	_pilot2 setdamage 1;
	_pilot3 setdamage 1;
	
	_chopper addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Chopper has been destroyed.'] call RE;
		wcmissionclear = true;
	}];