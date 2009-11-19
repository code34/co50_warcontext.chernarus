	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_object"];

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Chemical hazard ... ";
	wcmissiondescriptionW = "A hangar stocks some dangerous products. You must destroy it";
	wcmissiondescriptionE = "A hangar stocks some dangerous products and will be destroy by US ARMY, you must protect it";
	wcmissiontarget = "Chemical zone";
	_objectid = 172934;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	_object setdamage 0.4;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "chemicalhazard";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	nil = ['hangar', 0.5, position _object, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Destroy Hangar'] call WC_fnc_createmarker;

	waituntil {getDammage _object > 0.5};

	wcmissionokW = [2,true];
	publicvariable 'wcmissionokW';
	wcmissionokE = [2,false];
	publicvariable 'wcmissionokE';
	nil = [nil,nil,rHINT,'Hangar has been destroyed.'] call RE;
	wcmissionclear = true;
	wcscore = 10;