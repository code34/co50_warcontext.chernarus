	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: SEARCH
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private ["_missionend", "_target1", "_target2", "_target3", "_counter", "_missionnumber"];

	wcmissionauthor = "=[A*C]=Lueti";
	wcmissiondescriptionW = "The Russians lay siege to a city. Unfortunately, we do not have access to the satellite because it is in maintenance. We will have to do it the traditional way: locating and destroying mortar positions. Attention, we have no idea of the enemy forces present!";
	wcmissiondescriptionE = "We must take over a village !";
	wcmissiontarget = "Mortars positions";
	_missionnumber = 23;

	_randomposition = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	_nearestCity = nearestLocation [_randomposition, "NameVillage"];
	_position = position _nearestCity;
	wcmissionname = "Steel rain at " + text _nearestCity;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 500;
	_markername = "missiontownposition";
	_marker = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;
	nil = [_markername] call WC_fnc_randomizegroup;

	_group = creategroup east;
	_position = [_marker] call WC_fnc_createpositioninmarker;
	_target1 = "2b14_82mm" createVehicle _position;
	[_target1, "Mortar1", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Mortar'] spawn WC_fnc_attachmarker;
	_soldier1 = _group createUnit ["RUS_Soldier1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_soldier1 assignasgunner _target1;
	_soldier1 moveingunner _target1;
	nil = [_soldier1, wcskill] spawn WC_fnc_setskill;

	_position = [_marker] call WC_fnc_createpositioninmarker;
	_target2 = "2b14_82mm" createVehicle _position;
	[_target2, "Mortar2", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Mortar'] spawn WC_fnc_attachmarker;
	_soldier2 = _group createUnit ["RUS_Soldier1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_soldier2 assignasgunner _target2;
	_soldier2 moveingunner _target2;
	nil = [_soldier2, wcskill] spawn WC_fnc_setskill;

	_position = [_marker] call WC_fnc_createpositioninmarker;
	_target3 = "2b14_82mm" createVehicle _position;
	[_target3, "Mortar3", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Mortar'] spawn WC_fnc_attachmarker;
	_soldier3 = _group createUnit ["RUS_Soldier1", [_position select 0, (_position select 1) +3], [], 0, "NONE"];
	_soldier3 assignasgunner _target3;
	_soldier3 moveingunner _target3;
	nil = [_soldier3, wcskill] spawn WC_fnc_setskill;

	_target1 addeventhandler ['killed', {
		nil = [nil,nil,rHINT,'A mortar has been destroyed !'] call RE;
	}];

	_target2 addeventhandler ['killed', {
		nil = [nil,nil,rHINT,'A mortar has been destroyed !'] call RE;
	}];

	_target3 addeventhandler ['killed', {
		nil = [nil,nil,rHINT,'A mortar has been destroyed !'] call RE;
	}];

	_missionend = false;
	_counter = 0;
	while { !_missionend } do {
		if (getdammage _target1 > 0.5 && getdammage _target2 > 0.5 && getdammage _target3 > 0.5) then {
			_target1 setdammage 1;
			_target2 setdammage 1;
			_target3 setdammage 1;
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: West wins ! All mortars positions are down !'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if(_counter > 30) then {
			nil = [nil,nil,rHINT,'Side mission: East wins ! Too late!'] call RE;
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			wcmissionclear = true;
			_missionend = true;
		};
		sleep 60;
		_counter = _counter + 1;
	};