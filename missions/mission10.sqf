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

	wcobjectdown = false;
	wcobject2down = false;

	_objectid = 258926;
	_objectid2 = 258925;
	_objectid3 = 258924;
	
	_object = [_objectid] call WC_fnc_getobject;
	_object2 = [_objectid2] call WC_fnc_getobject;
	_object3 = [_objectid3] call WC_fnc_getobject;

	_position = position _object;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "fueltank";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername, true] call WC_fnc_randomizegroup;	

	_object addeventhandler ['killed', {
		wcobjectdown = true;
	}];

	_object2 addeventhandler ['killed', {
		wcobject2down = true;
	}];

	_object3 addeventhandler ['killed', {
		wcobject3down = true;
	}];

	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcobjectdown && wcobject2down && wcobject3down", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Big Smoke is done !'] call RE;
		wcmissionclear = true;
		wcobject1down = false;
		wcobject2down = false;
		wcobject3down = false;
		wcobject4down = false;
		wcobject5down = false;
		wcobject6down = false;
	", ""];