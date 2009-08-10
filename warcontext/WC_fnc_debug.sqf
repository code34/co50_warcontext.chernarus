// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Debuger
// -----------------------------------------------

	if (wcdebug) then {
		if (!isnil "wcdebugstartposition") then {player setpos wcdebugstartposition;};
		while{(true)} do{
			wcdebugcoord = getposasl player;
			wcdebugx = ceil(coord select 0);
			wcdebugy = ceil(coord select 1);
			wcdebugz = ceil(coord select 2);
			_listobjects = (position player) nearObjects 20;
			_nbobjects = count _listobjects;
			hintsilent format["
			Nb enemi: %1
			zone: %2
			Time: %3
			inventory: %4
			groupcount: %5
			level: %6
			maxenemyonmap: %7
			Coord: %8, %9, %10
			Nb objets near player: %11
			", 
			wccounttotalunit, 
			wctriggername, 
			wcmarkertime, 
			wctriggerinventory, 
			wcgroupcount, 
			wclevel, 
			wcmaxenemyonmap, 
			wcdebugx, 
			wcdebugy, 
			wcdebugz,
			_nbobjects
			];
			sleep 4;
			onMapSingleClick "player setPos _pos; true;";
		};
	};