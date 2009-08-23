// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Buzz of fly";
	wcmissiondescription = "The Russians still have shoots down one of our copters. 
	That is enough!We have order to go to destroy the antiaircraft site responsible for this slaughter";
	wcmissiontarget = "Anti_air_site";
	
	_position = [11478,11346,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_target = "anti-air_ru1";
	_target = [_target, 0, _position] call EXT_fnc_createcomposition;

	_markername = "AAsite";
	_markersize = 300;

	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_units = ["GUE_Woodlander3","GUE_Woodlander3","GUE_Woodlander3","GUE_Woodlander3","GUE_Woodlander3","GUE_Woodlander3","GUE_Woodlander3","GUE_Woodlander3","GUE_Woodlander3"];
	_group = [_position, west, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	nil = [_group, _position] call BIS_fnc_taskDefend;
	player setpos _position;
	
	//_target addeventhandler ['killed', {
	//	call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
	//	wcmissionclear = true;
	//	deletemarker _markername;
	//	deletevehicle trgintro;
	//}];
	
	nil = [_markername] call WC_fnc_randomizegroup;

	delmissiontrg = createTrigger["EmptyDetector",_position]; 
	delmissiontrg setTriggerArea[wctriggersize,wctriggersize,0,false];
	delmissiontrg setTriggerActivation["EAST","PRESENT", TRUE];
	delmissiontrg setTriggerStatements["this && wcmissionclear", "
			{
				_x setdamage 1;
			}foreach thislist;
			deletevehicle this;
	", ""];