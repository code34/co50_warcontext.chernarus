	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------

	private ["_array", "_position", "_pos", "_typeof", "_building", "_markername", "_group", "_x", "_unit", "_hostage", "_group", "_posarrive", "_missionend"];

	wcmissionauthor = "=[A*C]= Koss";
	wcmissionname = "Rescue the pilot";
	wcmissiondescription = "Russians force had captured one of our pilots. Rescue the pilot. ";
	wcmissiontarget = "Industry Complex";
	nil = [] spawn WC_fnc_publishmission;

	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	// Build random buildings
	_typeof = _array call BIS_fnc_selectRandom;
	_dir = random 360;
	_building = 'LAND_A_BUILDINGWIP' createVehicle _position;
	_building setVectorUp [0,0,1];
	_building setdir _dir;

	_target = ["camp_ru1", 0, [(_position select 0) + 70, _position select 1]] call EXT_fnc_createcomposition;

	_posarrive = [(_position select 0) + 50, _position select 1];

	_group = creategroup east;
	_posunit = [(position _building) select 0, ((position _building) select 1) + 50];
	for "_x" from 0 to 20 step 1 do {
		_unit = _group createUnit ["RUS_Soldier1", _posunit, [], 0, "NONE"];
		_unit addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
		nil = [_unit, wcskill] spawn WC_fnc_setskill;
	};

	nil = [_group, _building, 120] spawn WC_fnc_createhousepatrol;

	_group2 = creategroup west;
	_hostage = _group2 createUnit ["FR_TL", _posarrive, [], 0, "FORM"];
	_hostage setcaptive true;
	removeAllWeapons _hostage;
	nil = [_group2, _building, 120] spawn WC_fnc_createhousepatrol;

	nil = ['hostage', 0.5,  position _hostage, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Rescue the hostage'] call WC_fnc_createmarker;

	_missionend = false;
	while { !_missionend } do {
		if(count(units _group) < 3) then {
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'All enemy are dead.'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			_missionend = true;
			wcscore = 10;
			publicvariable 'wcscore';
		};
		if(!alive _hostage) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. One hostage has been killed'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			_missionend = true;
			wcscore = -10;
			publicvariable 'wcscore';
		};
		sleep 4;
	};
