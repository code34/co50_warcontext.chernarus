// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "The beast of war";
	wcmissiondescription = "A detachment of armored enemies is at rest in a camp. Tanks are empty and therefore inactive. This is an opportunity to reduce their impact force!";
	wcmissiontarget = "";
	wcmissionposition = [];
	nil = [] spawn WC_fnc_publishmission;


	_position = [_markername, "onvalley"] call WC_fnc_createpositioninmarker;


	nil = ["Weapon_Store_RU1", 0, [ ]] call func_createcomposition;
	nil = ["MediumTentCamp_RU", 0, [ ]] call func_createcomposition;
	nil = ["Fuel_Dump_RU1", 0, [ ]] call func_createcomposition;



	_tanks = createGroup east;
	call compile format ["_t90A = createvehicle [""T90"",%1, [ ], 0,""format""];", ];
	call compile format ["_t90B = createvehicle [""T90"",%1, [ ], 0,""format""];", ];
	call compile format ["_t90C = createvehicle [""T90"",%1, [ ], 0,""format""];", ];
	call compile format ["_t90D = createvehicle [""T90"",%1, [ ], 0,""format""];", ];
	call compile format ["_t90E = createvehicle [""T90"",%1, [ ], 0,""format""];", ];
	call compile format ["_t90F = createvehicle [""T90"",%1, [ ], 0,""format""];", ];
	call compile format ["_munitions = createvehicle [""KamazReammo"",%1, [ ], 0,""format""];", ];
	call compile format ["_btrA = createvehicle [""BTR90"",%1, [ ], 0,""format""];", ];
	call compile format ["_btrB = createvehicle [""BTR90"",%1, [ ], 0,""format""];", ];
	call compile format ["_btrC = createvehicle [""BTR90"",%1, [ ], 0,""format""];", ];


	_tanks addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		wcmissionclear = true;
	}];

//contrôle du script.
//reste à donner aux compositions et véhicules un agencement dans la position.