	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: DESTROY
	// -----------------------------------------------

	private ["_isflat", "_position", "_veh1", "_veh2", "_veh3", "_veh4", "_veh5", "_veh6", "_veh7", "_veh8", "_veh9"];

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "The beast of war";
	wcmissiondescription = "A detachment of armored enemies is at rest in a camp. Tanks are empty and therefore inactive. This is an opportunity to reduce their impact force!";
	wcmissiontarget = "Armors base";

	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_pos1 = [_position select 0 , (_position select 1) - 20];
	_pos2 = [( _position select 0) + 50 , (_position select 1) - 50];
	_pos3 = [( _position select 0) , (_position select 1) - 100];

	nil = ["Weapon_Store_RU1", 50, _pos1] call EXT_fnc_createcomposition;
	nil = ["MediumTentCamp_RU", 50, _pos2] call EXT_fnc_createcomposition;
	nil = ["Fuel_Dump_RU1", 50, _pos3] call EXT_fnc_createcomposition;

	_group = createGroup east;
	// create Empty T90
	for "_i" from 1 to 6 do {
		_position = [(_position select 0) + 10, _position select 1];
		call compile format["_veh%1 = 'T90' createVehicle _position;", _i];
		call compile format["_veh%1 addeventhandler ['killed', { wcvehko%1 = true; }];", _i];
	};

	// create Empty BTR90
	for "_i" from 7 to 9 do {
		_position = [(_position select 0) + 10, _position select 1];
		call compile format["_veh%1 = 'BTR90' createVehicle _position;", _i];
		call compile format["_veh%1 addeventhandler ['killed', { wcvehko%1 = true; }];", _i];
	};

	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcvehko1 && wcvehko2 && wcvehko3 && wcvehko4 && wcvehko5 && wcvehko6 && wcvehko7 && wcvehko8 && wcvehko9", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Armors are destroyed!'] call RE;
		wcmissionclear = true;
		wcvehko1 = false;
		wcvehko2 = false;
		wcvehko3 = false;
		wcvehko4 = false;
		wcvehko5 = false;
		wcvehko6 = false;
		wcvehko7 = false;
		wcvehko8 = false;
		wcvehko9 = false;
	", ""];