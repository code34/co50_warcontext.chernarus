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

	_timemax = 10;

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_planeposition = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "dropzone";
	_markersize = 1000;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	//nil = [_markername] call WC_fnc_randomizegroup;

	//_position = [_markername, "onmountain"] call WC_fnc_createpositioninmarker;
	//_tunguska1 = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	//[_tunguska1 select 0, "tung1"] spawn WC_fnc_attachmarker;

	//_position = [_markername, "onmountain"] call WC_fnc_createpositioninmarker;
	//_tunguska2 =[_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	//[_tunguska2 select 0, "tung2"] spawn WC_fnc_attachmarker;

	//_position = [_markername, "onmountain"] call WC_fnc_createpositioninmarker;
	//_tunguska3 =[_position, 0, "ZSU_INS", east] call BIS_fnc_spawnVehicle;
	//[_tunguska3 select 0, "tung3"] spawn WC_fnc_attachmarker;

	//_waittotimer = [_timemax, "Time before Airdrop:"] call WC_fnc_createtimer;

	nil = ["C130J", "USVehicleBox", _planeposition, _position] call WC_fnc_createparadrop;
	_vehicle = wccargo select 0; 
	[_vehicle, "c130"] spawn WC_fnc_attachmarker;

	_vehicle addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Failed'; ", wclevel];
		nil = [nil,nil,rHINT,'C130 has been destroyed.'] call RE;
		wcmissionclear = true;
	}];