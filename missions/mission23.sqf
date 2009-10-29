	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------

	wcmissionauthor = "=[A*C]=Lueti";
	wcmissiondescription = "Les Russes font le siège d'une ville. Malheureusement, nous n'avons pas accès au satellite qui est en maintenance, il va falloir faire ça à l'ancienne: repérage et destruction des emplacements de mortier. Attention,nous n'avons aucune idée des forces ennemies présentes!";
	wcmissiontarget = "";

	_randomposition = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_nearestCity = nearestLocation [_randomposition, "NameVillage"];
	_position = position _nearestCity;
	wcmissionname = "Steel rain at " + text _nearestCity;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	wcobjectdown1 = false;
	wcobjectdown2 = false;	
	wcobjectdown3 = false;

	_markersize = 500;
	_markername = "townposition";
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_group = creategroup east;

	_position = [_marker] call WC_fnc_createpositioninmarker;
	_target1 = "2b14_82mm" createVehicle _position;
	[_target1, "Mortier1", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Mortier'] spawn WC_fnc_attachmarker;
	_soldier1 = _group createUnit ["RUS_Soldier1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_soldier1 assignasgunner _target1;
	_soldier1 moveingunner _target1;

	_position = [_marker] call WC_fnc_createpositioninmarker;
	_target2 = "2b14_82mm" createVehicle _position;
	[_target2, "Mortier2", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Mortier'] spawn WC_fnc_attachmarker;
	_soldier2 = _group createUnit ["RUS_Soldier1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_soldier2 assignasgunner _target2;
	_soldier2 moveingunner _target2;

	_position = [_marker] call WC_fnc_createpositioninmarker;
	_target3 = "2b14_82mm" createVehicle _position;
	[_target3, "Mortier3", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Mortier'] spawn WC_fnc_attachmarker;
	_soldier3 = _group createUnit ["RUS_Soldier1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_soldier3 assignasgunner _target3;
	_soldier3 moveingunner _target3;

	_target1 addeventhandler ['killed', {
		wcobjectdown1 = true;
		nil = [nil,nil,rHINT,'A mortar has been destroyed !'] call RE;
	}];

	_target2 addeventhandler ['killed', {
		wcobject2down = true;
		nil = [nil,nil,rHINT,'A mortar has been destroyed !'] call RE;
	}];

	_target3 addeventhandler ['killed', {
		wcobject3down = true;
		nil = [nil,nil,rHINT,'A mortar has been destroyed !'] call RE;
	}];

	_trg=createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[50, 50 ,0,false];
	_trg setTriggerActivation["EAST","PRESENT",true];
	_trg setTriggerStatements["wcobjectdown1 && wcobject2down && wcobject3down", "
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'All mortars positions are down !'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
		wcobject1down = false;
		wcobject2down = false;
		wcobject3down = false;
	", ""];