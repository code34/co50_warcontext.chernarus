	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: Search
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private["_missionend", "_trg", "_counter", "_missionnumber"];

	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Spoils of War";
	wcmissiondescriptionW = "Finally, we have a small permission.We are going to take advantage of it to go catch some whisky bottles. The happiness is over there guys!";
	wcmissiondescriptionE = "Drink Whisky and take somes good times";
	wcmissiontarget = "Speyside Single Malt";
	_missionnumber = 3;

	_position = [8390,7341,0];
	wcwhisky = false;

	_crate = "Fort_crate_wood" createVehicle _position;
	nil = ['Whisky', 0.5, position _crate, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Whisky Crate'] call WC_fnc_createmarker;
	
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;
	
	_markername ="Glenlivet12years";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	_group = [_markername] call WC_fnc_randomizegroup;	

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["West","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcwhisky = true;
	"", """"];", wclevel];

	_counter = 0;
	_missionend = false;
	while { !_missionend } do {
		if(wcwhisky) then {
			nil = [nil,nil,rHINT,'Side mission: West wins ! They have whisky!'] call RE;
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late!'] call RE;
			wcmissionokE = [_missionnumber, true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber, false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};		
		sleep 60;
		_counter = _counter + 1;
	};

	deletevehicle _trg;

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);

	deletevehicle _trg;

	sleep 120;

	{
		_x setdammage 1;
		deletevehicle _x;
	}foreach (units _group);