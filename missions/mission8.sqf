// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: SECURE
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_sourceposition",
	"_position",
	"_markername",
	"_markersize",
	"_vehicle",
	"_combovehicle",
	"_crew"
	];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Flying bears";
	wcmissiondescription = "We are at the moment the only allied Forces on zone. The teams Panda et Kodiak will soon be parachuted. We have to make sure that they can make it safely. The dropzone must be thus cleaned.";
	wcmissiontarget = "Dropzone";

	_timemax = 5;

	_sourceposition = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "dropzone";
	_markersize = 1000;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
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

	_position = [_markername, "onvalley"] call WC_fnc_createpositioninmarker;
	_tunguska1 = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	_crew = _tunguska1 select 1;
	{_x setskill 1;}foreach _crew;

	_markernameAA = "AA1";
	_markersize = 50;
	nil = [_markernameAA, _markersize, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;


	_position = [_markername, "onvalley"] call WC_fnc_createpositioninmarker;
	_tunguska2 =[_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	_crew = _tunguska2 select 1;
	{_x setskill 1;}foreach _crew;

	_markernameAA = "AA2";
	_markersize = 50;
	nil = [_markernameAA, _markersize, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_position = [_markername, "onvalley"] call WC_fnc_createpositioninmarker;
	_tunguska3 =[_position, 0, "ZSU_INS", east] call BIS_fnc_spawnVehicle;
	_crew = _tunguska3 select 1;
	{_x setskill 1;}foreach _crew;

	_markernameAA = "AA3";
	_markersize = 50;
	nil = [_markernameAA, _markersize, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	while{(_timemax > time)} do{
		sleep 1;
		hint format["%1", time];
	};

	_combovehicle = [[_sourceposition select 0, _sourceposition select 1, 400], 0, "C130J", west] call BIS_fnc_spawnVehicle;
	_crew = _combovehicle select 1;
	_crew commandMove _position;
	_vehicle = _combovehicle select 0;
	player moveincargo _vehicle;