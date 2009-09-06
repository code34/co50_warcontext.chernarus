// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
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
	"_statement"
	];

	_markername 	= _this select 0;
	_position 	= _this select 1;
	_markersize 	= _this select 2;
	_object		= _this select 3;
	_objindex	= _this select 4;

	if (isnil "_object") then { _object = "Land_Fire"; };

	nil = [_markername, _markersize, _position, '', '', ''] call WC_fnc_createmarker;
	call compile format ["%1object = createVehicle [""%3"", %2, [], 50, """"];", _markername, _position, _object];
	call compile format ["%1object setVectorUp [0,0,1];", _markername];
	_crate = createVehicle ["USVehicleBox", _position, [], 50, ""];
	["", _crate] spawn WC_fnc_createammobox;
	
	call compile format ["wczoneready%1 = true; %1clear = false; wcsanity%1 = true;", _markername];

	// DETECTOR TRIGGER
	call compile format ["%1trg = createTrigger[""EmptyDetector"",%2];",_markername,_position]; 
	call compile format ["%1trg setTriggerArea[%2,%2,0,false];",_markername, wctriggersize];
	call compile format ["%1trg setTriggerActivation[""%2"",""PRESENT"", TRUE];",_markername, wcside];
	call compile format ["%1trg setTriggerStatements[""this && wczoneready%1 && !%1clear;"", ""
	wczoneready%1=false;
	nil = ['%1'] spawn WC_fnc_randomizegroup;
	"", """"];", _markername];

	// CLEAN TRIGGER
	call compile format ["%1trgsanity = createTrigger[""EmptyDetector"",%2];",_markername, _position]; 
	call compile format ["%1trgsanity setTriggerArea[%2,%2,0,false];",_markername, wctriggersize];
	call compile format ["%1trgsanity setTriggerActivation[""ANY"",""PRESENT"", TRUE];",_markername];
	call compile format ["%1trgsanity setTriggerStatements[""this && wcsanity%1 && !%1clear;"", "" 
	nil = [%1trgsanity, '%1', %2] spawn WC_fnc_cleantrigger;
	wcsanity%1=false;
	"", """"];", _markername, _markersize];

	// ZONE CLEAR TRIGGER
	call compile format ["%1trgend = createTrigger[""EmptyDetector"",%2];", _markername, _position];
	call compile format ["%1trgend setTriggerArea[%2,%2,0,false];", _markername, _markersize];
	call compile format ["%1trgend setTriggerActivation[""%2"",""NOT PRESENT"", FALSE];", _markername, wcenemyside];
	call compile format ["%1trgend setTriggerStatements[""this && !alive(%1object) && !wcsanity%1;"", ""
	%1clear=true;
	"", """"];", _markername, _objindex];