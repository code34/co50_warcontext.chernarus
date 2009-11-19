	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object"];

	wcmissionauthor ="=[A*C]= Lueti";
	wcmissionname = "Big smoke";
	wcmissiondescriptionW = "The Russians are going to have problem of fuel resupplying, we will help them! A civilian warned us that tanks have hardly just been fill. We are going to make a big big smoke. ";
	wcmissiondescriptionE = "US want to destroy a strategic fuel depot. Protect them";
	wcmissiontarget = "tank";

	wcobjectdown = false;
	wcobject2down = false;
	wcobject3down = false;

	_objectid = 258926;
	_objectid2 = 258925;
	_objectid3 = 258924;
	
	_object = [_objectid] call WC_fnc_getobject;
	nil = ['Fuel1', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Fuel'] call WC_fnc_createmarker;

	_object2 = [_objectid2] call WC_fnc_getobject;
	nil = ['Fuel2', 0.5, position _object2, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Fuel'] call WC_fnc_createmarker;

	_object3 = [_objectid3] call WC_fnc_getobject;
	nil = ['Fuel3', 0.5, position _object3, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Fuel'] call WC_fnc_createmarker;

	_position = position _object;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "fueltank";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;	

	waituntil {getDammage _object > 0.5};
	waituntil {getDammage _object2 > 0.5};
	waituntil {getDammage _object3 > 0.5};

	wcmissionokW = [10,true];
	publicvariable 'wcmissionokW';
	wcmissionokE = [10, false];
	publicvariable 'wcmissionokE';
	nil = [nil,nil,rHINT,'Big Smoke is done !'] call RE;
	wcmissionclear = true;
	wcscore = 10;