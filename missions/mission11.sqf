// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Centipede";
	wcmissiondescription = "An enemy convoy transport the equipment to build new military installations. We know about sure source that if this material is destroyed, it will be very difficult to replace it. Satellite pictures allowed us to localize the convoy. Strike fast and strong.";
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
	_arrayreturn = [_sourceposition, _destinationposition, _arrayofvehicle, east] call WC_fnc_createconvoy;

	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcvehko1 && wcvehko2 && wcvehko3 && wcvehko4 && wcvehko5 && wcvehko6", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Convoy is destroy!'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
		wcvehko1 = false;
		wcvehko2 = false;
		wcvehko3 = false;
		wcvehko4 = false;
		wcvehko5 = false;
		wcvehko6 = false;
	", ""];