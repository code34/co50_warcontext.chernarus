	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private ["_missionend", "_destinationposition", "_arrayreturn", "_arrayreturn1", "_arrayreturn2", "_arrayreturn3"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Target switch";
	wcmissiondescription = "Massive enemy reinforcements are on the way to Chernarus. They divided thoses reinforcements in several convoys in order to minimize the ambushes. Do your best to stop before they arrive to theirs destinations.";
	wcmissiontarget = "Convoy";

	_markersize = 500;
	_markername = "destinationposition";
	_destinationposition  = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	nil = [_markername, _markersize, _destinationposition, 'ColorRed', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	wcmissionposition = _destinationposition;
	nil = [] spawn WC_fnc_publishmission;


	// FIRST CONVOY
	_markersize = 500;
	_markername = "sourceposition";
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	nil = [_markername, _markersize, _sourceposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_arrayofvehicle = ["T90", "T90", "2S6M_Tunguska","GAZ_Vodnik"];
	_arrayreturn1 = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "convoy1_"] call WC_fnc_createconvoy;

	// SECOND CONVOY
	_markersize = 500;
	_markername = "sourceposition2";
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	nil = [_markername, _markersize, _sourceposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_arrayofvehicle = ["Bmp3", "Bmp3", "2S6M_Tunguska"];
	_arrayreturn2 = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "convoy2_"] call WC_fnc_createconvoy;

	// THIRD CONVOY
	_markersize = 500;
	_markername = "sourceposition3";
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	nil = [_markername, _markersize, _sourceposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_arrayofvehicle = ["T90", "2S6M_Tunguska", "Btr90", "Grad_RU", "KamazOpen"];
	_arrayreturn3 = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "convoy3_"] call WC_fnc_createconvoy;

	_arrayreturn = _arrayreturn1 + _arrayreturn2 + _arrayreturn3;

	_missionend = false;
	while { !_missionend } do {
		{		
			if (_x distance _destinationposition < 200) then {
				wcfail = true; 
				publicvariable 'wcfail'; 
				wcfail = false;
				nil = [nil,nil,rHINT,'Mission Failed.'] call RE;
				wcmissionok = false;
				wcmissionclear = true;
				_missionend = true;
			};
			if (!alive _x) then {
				_arrayreturn = _arrayreturn - [_x];
			};
			sleep 0.1;
		}foreach _arrayreturn;
		if (count _arrayreturn == 0) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'All convoys are destroyed!'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			_missionend = true;
		};
		sleep 4;
	};