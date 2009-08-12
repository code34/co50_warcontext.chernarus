// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: CLEAN
// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Bad trust";
	wcmissiondescription = "There is in this region, a guerrilla troop which fights for us,the Green bullets. Regrettably, they are not reliable.
	Reports indicate kidnapping and  executions aiming  the civilians in nearest villages.We have to stop these crimes before the population accuses us because we armed the Green bullets!";
	wcmissiontarget = "Guerrilleros";
	
	
	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_units = ["GUE_Worker2","GUE_Woodlander3","GUE_Villager3","GUE_Woodlander2","GUE_Woodlander1","GUE_Villager4"];
	_group1 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	_group2 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	
	_markername = "Green_bullets";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[wctriggersize,wctriggersize,0,false];
	_trg setTriggerActivation["EAST","NOT PRESENT", false];
	_trg setTriggerTimeout [10, 10, 10, true ];
	call compile format ["_trg setTriggerStatements[""this or count thislist < 2"", ""
		nil = [%2] call WC_fnc_deletemarker;
		wcmissionclear = true;
		publicvariable 'wcmissionclear';
	"", """"];", wclevel, _markername];