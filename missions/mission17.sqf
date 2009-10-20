	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Target switch";
	wcmissiondescription = "Massive enemy reinforcements are on the way to Chernarus. They divided thoses reinforcements in several convoys in order to minimize the ambushes. Do your best to destroy them as much as possible.";
	wcmissiontarget = "Convoy";

	_destinationposition  = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;

	// FIRST CONVOY
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;

	_position = _sourceposition;
	wcmissionposition = _sourceposition;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 500;
	_markername = "sourceposition";
	nil = [_markername, _markersize, _sourceposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_markersize = 500;
	_markername = "destinationposition";
	nil = [_markername, _markersize, _destinationposition, 'ColorRed', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_arrayofvehicle = ["T90", "T90", "2S6M_Tunguska","GAZ_Vodnik"];
	_arrayreturn = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "wcconvoy1ko", "convoy1_"] call WC_fnc_createconvoy;

	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcconvoy1ko1 && wcconvoy1ko2 && wcconvoy1ko3 && wcconvoy1ko4", "
		nil = [nil,nil,rHINT,'Convoy is destroy!'] call RE;
		wcconvoy1ko1 = false;
		wcconvoy1ko2 = false;
		wcconvoy1ko3 = false;
		wcconvoy1ko4 = false;
		wcconvoy1ok = true;
	", ""];

	// SECOND CONVOY
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_position = _sourceposition;

	_markersize = 500;
	_markername = "sourceposition2";
	nil = [_markername, _markersize, _sourceposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_arrayofvehicle = ["Bmp3", "Bmp3", "2S6M_Tunguska"];
	_arrayreturn = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "wcconvoy2ko", "convoy2_"] call WC_fnc_createconvoy;

	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcconvoy2ko1 && wcconvoy2ko2 && wcconvoy2ko3", "
		nil = [nil,nil,rHINT,'Convoy 2 is destroyed!'] call RE;
		wcconvoy2ko1 = false;
		wcconvoy2ko2 = false;
		wcconvoy2ko3 = false;
		wcconvoy2ok = true;
	", ""];

	// THIRD CONVOY
	_sourceposition = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_position = _sourceposition;
	
	_markersize = 500;
	_markername = "sourceposition3";
	nil = [_markername, _markersize, _sourceposition, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_arrayofvehicle = ["T90", "2S6M_Tunguska", "Btr90", "Grad_RU", "KamazOpen"];
	_arrayreturn = [_sourceposition, _destinationposition, _arrayofvehicle, east, true, "wcconvoy3ko", "convoy3_"] call WC_fnc_createconvoy;

	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcconvoy3ko1 && wcconvoy3ko2 && wcconvoy3ko3 && wcconvoy3ko4 && wcconvoy3ko5", "
		nil = [nil,nil,rHINT,'Convoy 3 is destroyed!'] call RE;
		wcconvoy3ko1 = false;
		wcconvoy3ko2 = false;
		wcconvoy3ko3 = false;
		wcconvoy3ko4 = false;
		wcconvoy3ko5 = false;
		wcconvoy3ok = true;
	", ""];

	// Final trigger
	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcconvoy1ok && wcconvoy2ok && wcconvoy3ok", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'All convoys are destroyed!'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
		wcconvoy1ok = false;
		wcconvoy2ok = false;
		wcconvoy3ok = false;
	", ""];