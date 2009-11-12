	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_groupsize", "_flag", "_leader", "_triggerinventory"];

	wctrgsanity = createTrigger["EmptyDetector", [7000,7000,0]];
	wctrgsanity setTriggerArea[wctriggersize,wctriggersize,0,false];
	wctrgsanity setTriggerActivation["ANY", "PRESENT", TRUE];
	wctrgsanity setTriggerStatements["this", "", ""];

	nil = [nil,nil,rHINT,'Sanityng urgency'] call RE;
	{
		_groupsize = count (units _x);
		_leader = leader _x;
		wctrgsanity setpos (position _leader);
		_triggerinventory = list wctrgsanity;
		if((wcside countside _triggerinventory) < 1) then {
			_flag = _leader getVariable "togarbage";
			if (!isnil "_flag") then {
				{
					_x setdammage 1;
				}foreach _x;
			};
		};
	}foreach wcgroups;

	true;