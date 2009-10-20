	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CLEAR ZONE
	// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionauthor = "code34";
	wcmissiondescription = "Enemy force received some reinforcements. Today you have to go to the battlefield and stop the enemy troops. Good luck !";
	wcmissiontarget = "The battle is here !";

	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;

	_nearestCity = nearestLocation [_position, "NameLocal"];
	wcmissionname = "Battle in region of " + text _nearestCity;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "battlefield";
	_markersize = 500;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername, true] call WC_fnc_randomizegroup;

	sleep 10;
	
	_trgmission0 = createTrigger["EmptyDetector", _position]; 
	_trgmission0 setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trgmission0 setTriggerActivation["EAST","NOT PRESENT", false];
	_trgmission0 setTriggerStatements["this or count thislist < 5", "
		nil = [nil,nil,rHINT,'Battlefied is clear'] call RE;
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		wcmissionok = true;
		wcmissionclear = true;
	", ""];