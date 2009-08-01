// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Big smoke";
	wcmissiondescription = "The Russians are going to have problem of fuel resupplying,we will help them!A civilian warned us that tanks have hardly just been fill. We are going to make a big big smoke. ";
	wcmissiontarget = "tank";
	_objectid = 258781;
	
	// DO NOT EDIT BELOW
	_object = [_objectid] call func_getobject;
	_position = position _object;
	
	wcmissionposition = _position;

	_markername = "fueltank";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call func_createmarker;
	
	_object addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		wcmissionclear = true;
		deletemarker _markername;
		deletevehicle trgintro;
	}];
	
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
	
	