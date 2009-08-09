// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: CLEAR ZONE
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor = "code34";
	wcmissionname = "Battle field " + format["%1", wclevel];
	wcmissiondescription = "Enemy force receive some renforcements. Today you have to go to the battle field and stop the enemy troops. Good luck !";
	wcmissiontarget = "The battle is here !";

	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;
	wcmissionposition = _position;
	_markername = "battlezone";
	_markersize = 500;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	sleep 120;
	nil = [_markername] call WC_fnc_randomizegroup;

	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[wctriggersize,wctriggersize,0,false];
	_trg setTriggerActivation["EAST","NOT PRESENT", false];
	_trg setTriggerTimeout [10, 10, 10, true ];
	call compile format ["_trg setTriggerStatements[""this or count thislist < 5"", ""
		nil = [%2] call WC_fnc_deletemarker;
		wcmissionclear = true;
		publicvariable 'wcmissionclear';
	"", """"];", wclevel, _markername];