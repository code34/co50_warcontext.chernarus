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
	_group = [_position, east, _units, [], [],"FORM"] call BIS_fnc_spawnGroup;
	
	
	_markername = "Green_bullets";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_group addeventhandler ['killed', {
		call compile format["task%1 settaskstate 'Succeeded'; ", wclevel];
		wcmissionclear = true;
		deletemarker _markername;
		deletevehicle trgintro;
	}];
	
	delmissiontrg = createTrigger["EmptyDetector",_position]; 
	delmissiontrg setTriggerArea[wctriggersize,wctriggersize,0,false];
	delmissiontrg setTriggerActivation["EAST","PRESENT", TRUE];
	delmissiontrg setTriggerStatements["this && wcmissionclear", "
			{
				_x setdamage 1;
			}foreach thislist;
			deletevehicle this;
	", ""];