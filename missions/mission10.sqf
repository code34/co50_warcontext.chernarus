// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Big smoke";
	wcmissiondescription = "The Russians are going to have problem of fuel resupplying, we will help them! A civilian warned us that tanks have hardly just been fill. We are going to make a big big smoke. ";
	wcmissiontarget = "tank";
	_objectid = 258926;
	
	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "fueltank";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername, true] call WC_fnc_randomizegroup;	

	_object addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Mission success.'] call RE;
		wcmissionclear = true;
	}];

	sleep 15;

	_object setdamage 1;
	