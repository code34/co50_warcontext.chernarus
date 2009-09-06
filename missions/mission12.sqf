// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: CLEAN
// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Bad trust";
	wcmissiondescription = "There is in this region, a guerrilla troop which fights for us,the Green bullets. Regrettably, they are not reliable. Reports indicate kidnapping and  executions aiming  the civilians in nearest villages. We have to stop these crimes before the population accuses us because we armed the Green bullets!";
	wcmissiontarget = "Guerrilleros";
		
	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_units = ["GUE_Worker2","GUE_Woodlander3","GUE_Villager3","GUE_Woodlander2","GUE_Woodlander1","GUE_Villager4"];
	_group1 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	_group2 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;

	_markername = "Green_bullets";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_trgmission12 = createTrigger["EmptyDetector", _position]; 
	_trgmission12 setTriggerArea[wctriggersize, wctriggersize, 0, false];
	_trgmission12 setTriggerActivation["GUER","NOT PRESENT", false];
	_trgmission12 setTriggerStatements["this or count thislist < 2", "
		nil = [nil,nil,rHINT,'Mission success'] call RE;
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		wcmissionclear = true;
	", ""];