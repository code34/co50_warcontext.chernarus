// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: CAPTURE
// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Robin hood";
	wcmissiondescription = "Civilians require food resources. 
	We currently have no support but a smuggling  truck was detected by our satellites. We must capture it and bring it to a point that supporters have provided.";
	wcmissiontarget = "Smuggling";
	
	_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_units = ["Ins_Commander","Ins_Soldier_AR","Ins_Soldier_AR","Ins_Soldier_1","Ins_Soldier_1","Ins_Soldier_AT","Ins_Soldier_CO","Ins_Soldier_CO","Ins_Soldier_CO","Ins_Soldier_AA"];
	_group1 = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	call compile format ["_foodtruck = createvehicle [""UralCivil"", %1, [], 0, ""NONE""];", _position];
	
	_markername ="Smuggling";
	_markersize = 300;
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_destination_position = [wcmaptopright, wcmapbottomleft, "notinforest"] call WC_fnc_createposition;
	_markername ="Delivery";
	_markersize = 100;
	nil = [_markername, _markersize, _destination_position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	
	_trg=createTrigger["EmptyDetector",_destination_position]; 
	_trg setTriggerArea[50,50,0,false];
	_trg setTriggerActivation["_foodtruck","PRESENT",true];
	call compile format ["_trg setTriggerStatements[""this"", 
		""hint 'OK, let the truck there, the supporters are going to get back it!',
		task%1 settaskstate 'Succeeded';
		wcmissionclear = true;
		deletevehicle trgintro;
		deletemarker _markername;
		deletevehicle _foodtruck;"",""""];
		", wclevel];
	 