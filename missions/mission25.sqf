// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Format C:";
	wcmissiondescription = "One of our choppers had his engine out of order and had to land of urgency.Regrettably, its embedded computer contains data relative to the positions of our strengths. It is thus necessary to go to blow up this device.";
	wcmissiontarget = "Mh down";
	wcmissionposition = [];

	_position =[wcmaptopright, wcmapbottomleft, "notinforest"] call WC_fnc_createpositioninmarker;

	call compile format ["_mh60 = createvehicle [""MH60S"", %1, [], 0 ""NONE""];", _position];

	nil = [_markername, true] call WC_fnc_randomizegroup;

	_mh60 addeventhandler ['killed', {
		nil = [nil,nil,rHINT,'Mission success'] call RE;
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		wcmissionclear = true;
	}];


//enlever le carburant du mh60
//createpositioninmarker ok ou createmarker en plus du createposition?