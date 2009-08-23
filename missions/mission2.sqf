// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor = "code34";
	wcmissionname = "Chemical hazard ... ";
	wcmissiondescription = "A hangar stocks some dangerous products. You must destroy it";
	wcmissiontarget = "Chemical zone";
	_objectid = 172851;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "chemicalhazard";
	_markersize = 300;

	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_object addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		nil = [nil,nil,rHINT,'Hangar had been destroy.'] call RE;
		wcmissionclear = true;
		deletemarker _markername;
		deletevehicle trgintro;
	}];
	
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