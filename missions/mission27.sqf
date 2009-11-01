	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: CLEAR ZONE
	// -----------------------------------------------
	if (!isServer) exitWith{};

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Naufrageurs";
	wcmissiondescription = "A pirates' band takes advantage of the instability for wrecked the commercial ships which pass in the wide. We have to prevent them from continuing.";
	wcmissiontarget = "Pirates camp";

	_composition1 = [["Create",101,[["Land_Ind_IlluminantTower"],"Regular","Empty",0,10,0],[13631.4,3165.25,0]],["Create",102,[["ACamp"],"Regular","Empty",0,10,0],[13638.3,3145.94,0]],["Create",103,[["ACamp"],"Regular","Empty",0,10,0],[13638.7,3149.36,0]],["Create",104,[["Land_Campfire_burning"],"Regular","Empty",0,10,0],[13633.4,3148.11,0]],["Create",105,[["Land_A_tent"],"Regular","Empty",0,10,0],[13635.3,3141,0]],["Create",106,[["Land_A_tent"],"Regular","Empty",0,10,0],[13633.3,3141.06,0]],["Create",107,[["Misc_cargo_cont_small"],"Regular","Empty",0,10,0],[13627.7,3144.77,0]],["Create",108,[["ACamp"],"Regular","Empty",312,10,0],[13636.9,3153.44,0]],["Create",109,[["Mi17_Civilian"],"Regular","Empty",359.996,10,0],[13631.6,3118.07,0]]]
	_composition2 = [["Create",101,[["ACamp"],"Regular","Empty",228.15,10,0],[13942.5,11315.7,0]],["Create",102,[["ACamp"],"Regular","Empty",264.308,10,0],[13947.3,11316.6,0]],["Create",103,[["ACamp"],"Regular","Empty",201.084,10,0],[13941,11310.9,0]],["Create",104,[["ACamp"],"Regular","Empty",155.318,10,0],[13942.7,11306.5,0]],["Create",105,[["ACamp"],"Regular","Empty",297.533,10,0],[13952.4,11314,0]],["Create",106,[["Land_Campfire_burning"],"Regular","Empty",306.523,10,0],[13949.4,11308,0]],["Create",107,[["Land_Ind_IlluminantTower"],"Regular","Empty",303.76,10,0],[13915.1,11268.3,0]],["Create",108,[["Misc_cargo_cont_small"],"Regular","Empty",314.794,10,0],[13958.1,11307.3,0]]]

	nil = [_composition, true] call WC_fnc_restorebuildingfrommerlin;

	_arrayofposition = [
			[13623,3173,0],
			[14009,11281,0]
	];

	_position = _arrayofposition call BIS_fnc_selectRandom;

	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;


	_units = ["GUE_Worker2","GUE_Woodlander3","GUE_Villager3","GUE_Woodlander2","GUE_Woodlander1","GUE_Villager4"];
	_group1 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	_group2 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;

	_markername = "Pirates camp";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_position = [(_position select 0) -10, (_position select 1) - 10];
	nil = "Land_Campfire_burning" createvehicle _position;

	_flag = ['piratescamp', 0.5, _position, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Pirates camp'] call WC_fnc_createmarker;

	_trgmission = createTrigger["EmptyDetector", _position]; 
	_trgmission setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trgmission setTriggerActivation["GUER","NOT PRESENT", false];
	_trgmission setTriggerStatements["this or count thislist < 2", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Pirates are down !'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	", ""];