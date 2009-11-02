	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_rabbit", "_markername", "_position", "_counter"];

	wcmissionauthor ="=[A*C]= D-Styles";
   	wcmissionname = "Breack eye";
   	wcmissiondescription = "Scientists from the Russian army had conceive with the help of umbrella corporation a virus. According to one of our chernarus contact, they had made a first experience on a rabbit that will release into the wild today ... We can not wait any longer ... find the rabbit and kill it before the virus begins its transformation.";
	wcmissiontarget = "Scientists";

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 300;
	_markername = "rabbitzone";
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_foldtable = "foldtable" createVehicle _position;

	_position2 = getposatl _foldtable;
	_notebook = "Notebook" createVehicle _position;
	_notebook allowDamage false;
	_notebook setposatl [_position2 select 0, _position2 select 1, (_position2 select 2) + 0.65];
	nil = ['Experience', 0.5, _position2, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Experience'] call WC_fnc_createmarker;

	_rabbitgroup = creategroup east;
	_rabbit = _rabbitgroup createUnit ["rabbit", [_position2 select 0, (_position2 select 1) + 50], [], 0, "NONE"];
	_rabbitgroup allowFleeing 1;

	_notebook addAction ['Trace Rabbit', 'warcontext\WC_fnc_createtracer.sqf', [_rabbit, 'Hector'], 0, false, true, ''];

	_group = creategroup east;	
	_scientist1 = _group createUnit ["Doctor", [_position2 select 0, (_position2 select 1) +3], [], 0, "NONE"];
	_scientist2 = _group createUnit ["Doctor", [_position2 select 0, (_position2 select 1) +4], [], 0, "NONE"];
	
	_counter = 0;
	_missionend = false;
	while { !_missionend } do {
		if (getdammage _rabbit < 0.8) then {
			_position = [_markername] call WC_fnc_createpositioninmarker;
			_rabbit doMove _position;
		};
		if (getdammage _rabbit > 0.79 or !alive _rabbit) then {
			_rabit setdamage 1;
			wcsuccess = true; 
			publicvariable 'wcsuccess'; 
			wcsuccess = false;
			nil = [nil,nil,rHINT,'Hector is dead.'] call RE;
			wcmissionok = true;
			wcmissionclear = true;
			_missionend = true;
		};
		if (_counter > 30) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. Rabbit has infected the region'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			_missionend = true;
		};
		if (count (units _group) < 2) then {
			wcfail = true; 
			publicvariable 'wcfail'; 
			wcfail = false;
			nil = [nil,nil,rHINT,'Mission Failed. You have killed iminent Scientists!'] call RE;
			wcmissionok = false;
			wcmissionclear = true;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};