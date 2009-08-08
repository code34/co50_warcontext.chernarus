// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------

	_kindofvehicle = [
		"Skoda",
		"datsun1_civil_1_open",
		"datsun1_civil_2_covered",
		"datsun1_civil_3_open",
		"car_hatchback",
		"car_sedan",
		"Landrover_Police",
		"Bus_city",
		"tractor",
		"hilux1_civil_1_open",
		"hilux1_civil_2_covered",
		"hilux1_civil_3_open",
		"UralCivil",
		"UralCivil2",
		"UralOpen"
	];

	if(random 100 < 10) then {
		_kindofvehicle = [
			"LandroverMG",
			"Landrover_Closed",
			"Landrover",
			"BRDM2",
			"Mi17_MG",
			"t72",
			"UAZMG",
			"UAZ_AGS30",
			"BMP2",
			"UralRepair",
			"Uralrefuel",
			"UralReammo",
			"ZSU"
		];
	};

	_numindex = count _kindofvehicle;
	_typeofvehicle = _kindofvehicle select (random _numindex);
	_vehicle = createVehicle [_typeofvehicle, _position, [], 40, 'NONE'];
	_vehicle addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
	wccounttotalunit = wccounttotalunit + 1;