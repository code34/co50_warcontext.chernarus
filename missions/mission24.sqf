	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------

	private ["_array", "_position", "_pos", "_typeof", "_building", "_markername", "_group", "_x", "_unit", "_hostage", "_hostagegroup", "_posarrive"];

	wcmissionauthor = "=[A*C]= Koss";
	wcmissionname = "Rescue the hostages";
	wcmissiondescription = "Russians force had captured 2 of our pilotes. Rescue the hostages! ";
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
	_x = 0;
	while { format ["%1", _building buildingPos _x] != "[0,0,0]" } do {
		if (random 1 > 0.7) then {
			_group = creategroup east;
			_pos = _building buildingPos _x;
			_unit = _group createUnit ["RUS_Soldier1", _posarrive, [], 0, "FORM"];
			_unit addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
			_wp = _group addWaypoint [_pos, 0];
			[_group, 0] setWaypointHousePosition _x;
			[_group, 0] setWaypointType "SENTRY";
			[_group, 0] setWaypointCombatMode "RED";
			[_group, 0] setWaypointBehaviour "AWARE";
			sleep 0.01;
		};
		_x = _x + 1;
	};

	_group = creategroup west;
	_hostage = _group createUnit ["FR_TL", _posarrive, [], 0, "FORM"];
	_hostage setcaptive true;
	_wp = _group addWaypoint [_pos, 0];
	[_group, 0] setWaypointHousePosition _x;
	[_group, 0] setWaypointType "TALK";
	removeAllWeapons _hostage;
	[_hostage, "hostage", 1, 'ColorGreen', 'ICON', 'FDIAGONAL', 2, 'WARNING', 0 , 'hostage'] spawn WC_fnc_attachmarker;

	_hostage addeventhandler ['killed', {
		wcfail = true; 
		publicvariable 'wcfail'; 
		wcfail = false;
		nil = [nil,nil,rHINT,'Mission Failed. Hostage has been killed'] call RE;
		wcmissionok = false;
		wcmissionclear = true;
	}];


	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[200, 200 ,0,false];
	_trg setTriggerActivation["EAST","NOT PRESENT", false];
	call compile format ["_trg setTriggerStatements[""this or count thislist < 2"", ""
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'All enemy are dead.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	"", """"];", wclevel];

	player setpos [(_position select 0) + 200, _position select 1];