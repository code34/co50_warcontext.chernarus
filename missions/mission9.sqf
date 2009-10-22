	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Buzz of fly";
	wcmissiondescription = "The Russians still have shoots down one of our copters. That is enough! We just receive orders to destroy the RADAR site responsible for this slaughter";
	wcmissiontarget = "Anti_air_site";
	
	_position = [11478,11346,0];
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_target = createVehicle ["RU_WarfareBArtilleryRadar", _position, [], 0, "NONE"];
	[_target, "Radar", 1, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , 'Radar'] spawn WC_fnc_attachmarker;

	_target addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Radar has been destroyed.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];