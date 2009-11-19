	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_list", "_centerx", "_centery", "_inventory", "_group", "_leader", "_flag", "_lastcount"];

	_centerx = (wcmaptopright select 0) / 2;
	_centery = (wcmaptopright select 1) / 2;

	wctrgsanity = createTrigger["EmptyDetector", [_centerx,_centery,0]];
	wctrgsanity setTriggerArea[20000, 20000, 0, false];
	wctrgsanity setTriggerActivation["EAST", "PRESENT", TRUE];
	wctrgsanity setTriggerStatements["this", "", ""];

	wctrggarbage = createTrigger["EmptyDetector", [_centerx,_centery,0]];
	wctrggarbage setTriggerArea[wctriggersize, wctriggersize, 0, false];
	wctrggarbage setTriggerActivation["ANY", "PRESENT", TRUE];
	wctrggarbage setTriggerStatements["this", "", ""];


	// waiting to retrieve all the units in triggers
	sleep 10;

	while {!wcgameend} do {
		wcgroups = [];
		_list = list wctrgsanity;
		{
			if!((group _x) in wcgroups) then {
				wcgroups = wcgroups + [(group _x)];
			};
		}foreach _list;

		_lastcount = count wcgroups;
		while {_lastcount > 200} do {
			_group = wcgroups call BIS_fnc_selectRandom;
			_leader = leader _group;
			_flag = _leader getVariable "togarbage";
			if (!isnil "_flag" or (count wcgroups) >= _lastcount) then {
				wctrggarbage setpos (position (_leader));
				sleep 5;
				_inventory = list wctrggarbage;
				if( west countside _inventory == 0) then {
					{
						_x setdammage 1;
						deletevehicle _x;			
					}foreach _inventory;
					wcgroups = wcgroups - [_group];
				};
			};
			nil = [nil,nil,rHINT, format["Sanityng urgency. Max group of : %1", count wcgroups]] call RE;
		};
		sleep 4;
	};

	deletevehicle wctrggarbage;
	deletevehicle wctrgsanity;
	true;