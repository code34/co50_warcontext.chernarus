	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private ["_missionend", "_destinationposition", "_arrayreturn"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Centipede";
	wcmissiondescription = "An enemy convoy transport the equipments to build new military installations. We know about sure source that if this material is destroyed, it will be very difficult to replace. Satellite pictures allowed us to localize the convoy. Strike fast and strong.";
	wcmissiontarget = "vehicles";
	
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destinationposition  = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;

	_position = _sourceposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 500;
	_markername = "sourceposition";
	nil = [_markername, _markersize, _sourceposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_markersize = 500;
	_markername = "destinationposition";
	nil = [_markername, _markersize, _destinationposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_arrayofvehicle = ["Kamaz","KamazRepair", "Kamaz", "BTR90", "UAZ_AGS30_RU", "KamazReammo"];
	_arrayreturn = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "convoy1_"] call WC_fnc_createconvoy;

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
			nil = [nil,nil,rHINT,'Convoy is destroy!'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			_missionend = true;
		};
		sleep 4;
	};