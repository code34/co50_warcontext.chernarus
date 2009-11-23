	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private ["_missionend", "_destinationposition", "_arrayreturn", "_arrayreturn1", "_arrayreturn2", "_arrayreturn3", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Target switch";
	wcmissiondescriptionW = "Massive enemy reinforcements are on the way to Chernarus. They divided thoses reinforcements in several convoys in order to minimize the ambushes. Do your best to stop before they arrive to theirs destinations.";
	wcmissiondescriptionE = "Enemy try to destroy our new forces ... They dream";
	wcmissiontarget = "Convoy";
	_missionnumber = 17;

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
	_counter = 0;
	while { !_missionend } do {
		{		
			if (_x distance _destinationposition < 200) then {
				wcmissionokW = [_missionnumber,false];
				publicvariable 'wcmissionokW';
				wcmissionokE = [_missionnumber,true];
				publicvariable 'wcmissionokE';
				nil = [nil,nil,rHINT,'East wins. Convoys are at destination'] call RE;
				wcmissionclear = true;
				wcscore = 10;
				nil = [wcscore, wcenemyside] spawn WC_fnc_score;
				_missionend = true;
			};
			if (!alive _x) then {
				_arrayreturn = _arrayreturn - [_x];
			};
			sleep 0.1;
		}foreach _arrayreturn;
		if (count _arrayreturn == 0) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'All convoys are destroyed!'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (_counter > 30) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Too late. East wins.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};