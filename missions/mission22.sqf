	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------

	private ["_array", "_position", "_pos", "_typeof", "_building", "_markername", "_group", "_x", "_unit", "_hostage", "_hostagegroup", "_posarrive"];

	wcmissionauthor = "=[A*C]= Koss";
	wcmissionname = "Operation SWAT ";
	wcmissiondescription = "Russians are trying to take over the country industry. They kidnapped the direction members of the largest agricultural enterprise 'Foodin'. The food ressources are important to control populations, we must immediately release thoses peoples.";
	wcmissiontarget = "";

	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_composition = [[[9.89307,-4.45776,0],0,"Land_A_CraneCon"],[[-11.418,-4.4541,0],0,"USMC_Soldier"],[[-12.0479,19.7649,-0.00346565],0,"Land_A_BuildingWIP"],[[26.2505,9.43237,4.76837e-007],90,"Land_A_BuildingWIP"],[[-22.562,-18.4939,4.76837e-007],270,"Land_A_BuildingWIP"],[[15.7607,-28.8486,-0.00137711],180,"Land_A_BuildingWIP"],[[-34.8086,34.8835,-4.76837e-007],90,"Land_Misc_Scaffolding"],[[-52.125,10.2358,-4.76837e-007],90,"Land_Misc_Scaffolding"],[[-37.5737,-41.2734,0],0,"Land_Misc_Scaffolding"],[[-57.8853,-4.67456,4.76837e-007],359.977,"Land_A_BuildingWIP"],[[56.0186,-19.3071,0],270,"Land_Misc_Scaffolding"],[[61.5684,-4.43018,4.76837e-007],180.078,"Land_A_BuildingWIP"],[[scalar,scalar,any],scalar,string]];
	nil = [_position, _composition, true] call WC_fnc_restorebuilding;

	sleep 10;

	_markersize = 500;
	_markername = "destinationposition";
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_group = creategroup east;
	for "_x" from 0 to 20 step 1 do {
		_unit = _group createUnit ["RUS_Soldier1", _position, [], 0, "NONE"];
		_unit addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];
		nil = [_unit, wcskill] spawn WC_fnc_setskill;
		sleep 0.1;
	};

	nil = [_group, _position, 30] spawn WC_fnc_createtownpatrol;

	_group = creategroup west;
	_hostage = _group createUnit ["RU_Functionary1", _position, [], 0, "FORM"];
	_hostage setcaptive true;
	removeAllWeapons _hostage;
	_hostage addeventhandler ['killed', {
		wcfail = true; 
		publicvariable 'wcfail'; 
		wcfail = false;
		nil = [nil,nil,rHINT,'Mission Failed. One hostage has been killed'] call RE;
		wcmissionok = false;
		wcmissionclear = true;
	}];

	[_hostage, "hostage", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'hostage'] spawn WC_fnc_attachmarker;
	nil = [_group, _position, 30] spawn WC_fnc_createtownpatrol;

	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[100, 100 ,0,false];
	_trg setTriggerActivation["EAST","NOT PRESENT", false];
	call compile format ["_trg setTriggerStatements[""this or count thislist < 2"", ""
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'All enemy are dead.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	"", """"];", wclevel];