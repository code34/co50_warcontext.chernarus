// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: 
// -----------------------------------------------

	private ["_rabbit", "_markername", "_position"];

	wcmissionauthor ="=[A*C]= D-Styles";
   	wcmissionname = "Breack eye";
   	wcmissiondescription = "Scientists from the Russian army had conceive with the help of umbrella corporation a virus. According to one of our chernarus contact, they had made a first experience on a rabbit that will release into the wild today ... We can not wait any longer ... find the rabbit and kill it before the virus begins its transformation.";
	wcmissiontarget = "Scientists";

	_position = [wcmaptopright, wcmapbottomleft] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 1000;
	_markername = "rabbitzone";
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_foldtable = "foldtable" createVehicle _position;
	_foldtable allowDamage false;
	[_foldtable, "Experience", 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Flag', 0 , 'Experience'] spawn WC_fnc_attachmarker;

	_position2 = getposasl _foldtable;
	_notebook = "Notebook" createVehicle _position;
	_notebook setposasl [_position2 select 0, _position2 select 1, (_position2 select 2) + 0.65];

	_rabbitgroup = creategroup east;
	_rabbit = _rabbitgroup createUnit ["rabbit", [_position2 select 0, (_position2 select 1) + 50], [], 0, "NONE"];
	_rabbitgroup allowFleeing 1;

	_notebook addAction ["Trace Rabbit", "warcontext\WC_fnc_createtracer.sqf", [_rabbit, "Hector"], 0, false, true, ""];

	_group = creategroup east;	
	_scientist1 = _group createUnit ["Doctor", [_position2 select 0, (_position2 select 1) +3], [], 0, "NONE"];
	_scientist2 = _group createUnit ["Doctor", [_position2 select 0, (_position2 select 1) +4], [], 0, "NONE"];
	
	_rabbit addeventhandler ['killed', {
		wcsuccess = true; 
		publicvariable 'wcsuccess'; 
		wcsuccess = false;
		nil = [nil,nil,rHINT,'Hector is dead.'] call RE;
		wcmissionok = true;
		wcmissionclear = true;
	}];

	while {(alive _rabbit)} do {
		_position = [_markername] call WC_fnc_createpositioninmarker;
		_rabbit commandMove _position;
		waituntil {(_rabbit distance _position < 10)};
		sleep 1;
	};