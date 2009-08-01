// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	sleep 10;

	wcmissionauthor = "code34";
	wcmissionname = "Chemical hazard ... ";
	wcmissiondescription = "A hangar stocks some dangerous products. You must destroy it";
	wcmissiontarget = "Chemical zone";
	_objectid = 172851;

	// DO NOT EDIT BELOW
	_object = [_objectid] call func_getobject;
	_position = position _object;

	wcmissionposition = _position;

	_markername = "chemicalhazard";
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