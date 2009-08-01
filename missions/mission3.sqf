// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: Search
// -----------------------------------------------
if (!isServer) exitWith{};

	sleep 3;

	wcmissionauthor ="A*C Lueti";
	wcmissionname = "Spoils of War";
	wcmissiondescription = "Finally, we have a small permission.We are going to take advantage of it to go catch some whiskey bottles.The happiness is over there guys!";
	wcmissiontarget = "Speyside Single Malt";

	_position = [8390,7341,0];
	call compile format ["_whisky = createvehicle [""Fort_crate_wood"", %1, [], 0, ""NONE""];", _position];
	
	wcmissionposition = _position;
	
	_markername ="Glenlivet12years";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call func_createmarker;

	_trg=createTrigger["EmptyDetector",_position]; 
	_trg setTriggerArea[5,5,0,false];
	_trg setTriggerActivation["West","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", 
		""hint 'We have the whisky, we need glasses now!',
		task%1 settaskstate 'Succeeded';
		wcmissionclear = true;
		deletevehicle trgintro;
		deletemarker _markername;
		deletevehicle _whisky;"",""""];
		", wclevel];
	 
	nil = [_markername] call func_randomizegroup;

	delmissiontrg = createTrigger["EmptyDetector",_position]; 
	delmissiontrg setTriggerArea[wctriggersize,wctriggersize,0,false];
	delmissiontrg setTriggerActivation["EAST","PRESENT", TRUE];
	delmissiontrg setTriggerStatements["this && wcmissionclear", "
			{
				_x setdamage 1;
			}foreach thislist;
			deletevehicle this;
	", ""];