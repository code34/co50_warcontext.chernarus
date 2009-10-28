// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor = "=[A*C]= code34";
	wcmissionname = "Chemical hazard ... ";
	wcmissiondescription = "A hangar stocks some dangerous products. You must destroy it";
	wcmissiontarget = "Chemical zone";
	_objectid = 172934;

	_object = [_objectid] call WC_fnc_getobject;
	_position = position _object;
	_object setdamage 0.90;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markername = "chemicalhazard";
	_markersize = 300;

	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	[_object, "hangar", 1, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'hangar'] spawn WC_fnc_attachmarker;

	_object addeventhandler ['killed', { 
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Hangar has been destroyed.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];
