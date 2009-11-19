	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private ["_missionend", "_destinationposition", "_arrayreturn"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Centipede";
	wcmissiondescriptionW = "An enemy convoy transport the equipments to build new military installations. We know about sure source that if this material is destroyed, it will be very difficult to replace. Satellite pictures allowed us to localize the convoy. Strike fast and strong.";
	wcmissiondescriptionE = "An important convoy is on the road to build a new base. Make sur that they will not have problems";
	wcmissiontarget = "vehicles";
	
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destinationposition  = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;

	_position = _sourceposition;
	wcmissionposition = _destinationposition;
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
				wcmissionokW = [11,false];
				publicvariable 'wcmissionokW';
				wcmissionokE = [11,true];
				publicvariable 'wcmissionokE';
				nil = [nil,nil,rHINT,'Convoy arrive to its destination.'] call RE;
				wcmissionclear = true;
				wcscore = -10;
				_missionend = true;
			};
			if (!alive _x) then {
				_arrayreturn = _arrayreturn - [_x];
			};
			sleep 0.1;
		}foreach _arrayreturn;
		if (count _arrayreturn == 0) then {
			wcmissionokW = [11,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [11, false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Convoy has been destroyed!'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			_missionend = true;
		};
		sleep 4;
	};