	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: Search
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private["_missionend", "_trg"];

	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Spoils of War";
	wcmissiondescription = "Finally, we have a small permission.We are going to take advantage of it to go catch some whiskey bottles. The happiness is over there guys!";
	wcmissiontarget = "Speyside Single Malt";

	_position = [8390,7341,0];
	wcwhisky = false;

	_crate = "Fort_crate_wood" createVehicle _position;
	[_crate, "Whisky", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Whisky'] spawn WC_fnc_attachmarker;
	
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;
	
	_markername ="Glenlivet12years";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;	

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["West","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcwhisky = true;
	"", """"];", wclevel];

	_missionend = false;
	while { !_missionend } do {
		if(wcwhisky) then {
			nil = [nil,nil,rHINT,'We have the whisky, we need glasses now!'] call RE;
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			wcmissionok = true;
			wcscore = 10;
			publicvariable 'wcscore';
			wcmissionclear = true;
			_missionend = true;
		};
		sleep 60;
	};

	deletevehicle _trg;