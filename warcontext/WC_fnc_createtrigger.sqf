// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// wcsanity(true) if zone have to be clean, false if zone is currently being monitoring to be clear
// wczoneready(true) if zone trigger side to pop enemy , false if zone is currently poping enemy
// markernameclear(false)
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_markername",
	"_markersize",
	"_position",
	"_object",
	"_x", 
	"_y", 
	"_z", 
	"_xtemp",
	"_objindex",
	"_ytemp",
	"_statement",
	"_handling"
	];

	_markername 	= _this select 0;
	_position 	= _this select 1;
	_markersize 	= _this select 2;
	_object		= _this select 3;
	_objindex	= _this select 4;

	if (isnil "_object") then { _object = "Land_Fire"; };

	// Define a check zone fonction 
	WC_fnc_checkzoneclear = {
		private ["_minutes", "_trigger", "_total", "_triggerinventory", "_countW", "_countE", "_result"];
		_trigger 	= _this select 0;
		_markername 	= _this select 1;
		_minutes = 6;
		_total = 0;

		 for "_i" from 1 to _minutes do {
		 	sleep 20;
		 	_triggerinventory = list _trigger;
		 	_countW = west countSide _triggerinventory;
		 	_countE = wcenemyside countSide _triggerinventory;
		 	if ((_countE < 3) and (_countW > 0)) then { 
		 		_total = _total + 1;
		 	}else{
				hint format["count %1 %2", _countE, _countW];
			};
		 };
		
		 if (_total + 1 >= _minutes) then {
		 	_result = true;
		 	nil = [nil,nil,rHINT,'Zone is clear'] call RE;
		 	call compile format ["
		 		%1clear = true;
		 		wczoneready%1 = true;
				if (wcdebug or wcshowmarkers) then {'flag%1' setMarkerColor 'ColorGreen';
				};
		 	", _markername];
		 } else {
		 	_result = false;
		 };
		 _result;
	};

	nil = [_markername, _markersize, _position, '', '', ''] call WC_fnc_createmarker;
	call compile format ["%1object = createVehicle [""%3"", %2, [], 50, """"];", _markername, _position, _object];
	call compile format ["%1object setVectorUp [0,0,1];", _markername];
	if (wcdebug or wcshowmarkers) then {
		call compile format ["_flag = ['flag%1', 1, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'City'] call WC_fnc_createmarker;", _markername];
	};

	//call compile format ["nil = [%1object, 'city%1', 1, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'City', 0 , ''] spawn WC_fnc_attachmarker;", _markername];
	call compile format ["wczoneready%1 = true; %1clear = false; wcsanity%1 = true;", _markername];

	// DETECTOR TRIGGER
	call compile format ["%1trg = createTrigger[""EmptyDetector"",%2];",_markername,_position]; 
	call compile format ["%1trg setTriggerArea[%2,%2,0,false];",_markername, wctriggersize];
	call compile format ["%1trg setTriggerActivation[""%2"",""PRESENT"", TRUE];",_markername, wcside];
	call compile format ["%1trg setTriggerStatements[""this && wczoneready%1 && !%1clear;"", ""
	wczoneready%1=false;
	nil = ['%1', true] spawn WC_fnc_randomizegroup;
	"", """"];", _markername];

	// CLEAN TRIGGER
	call compile format ["%1trgsanity = createTrigger[""EmptyDetector"",%2];",_markername, _position]; 
	call compile format ["%1trgsanity setTriggerArea[%2,%2,0,false];",_markername, wctriggersize];
	call compile format ["%1trgsanity setTriggerActivation[""ANY"",""PRESENT"", TRUE];",_markername];
	call compile format ["%1trgsanity setTriggerStatements[""this && wcsanity%1 && !%1clear;"", "" 
	nil = [%1trgsanity, '%1', %2] spawn WC_fnc_cleantrigger;
	wcsanity%1=false;
	"", """"];", _markername, _markersize];

	// ZONE TAKEN
	call compile format ["%1trgend = createTrigger[""EmptyDetector"",%2];", _markername, _position];
	call compile format ["%1trgend setTriggerArea[%2,%2,0,false];", _markername, _markersize];
	call compile format ["%1trgend setTriggerTimeout [20, 20, 20, true];", _markername, _markersize];
	call compile format ["%1trgend setTriggerActivation[""ANY"",""NOT PRESENT"", TRUE];", _markername, wcenemyside];
	call compile format ["%1trgend setTriggerStatements[""(this or (east countside thislist) < 3) && !wczoneready%1"", ""
	nil= [%1trgend, '%1'] spawn WC_fnc_checkzoneclear;
	"", """"];", _markername, _objindex];