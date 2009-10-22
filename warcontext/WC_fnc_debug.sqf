// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Debuger - works only on local
// -----------------------------------------------

	if (wcdebug) then {
		if (!isnil ("wcdebugstartposition")) then {player setpos wcdebugstartposition;};
		while{(true)} do {
			wcdebugcoord = getposasl player;
			wcdebugx = ceil(wcdebugcoord select 0);
			wcdebugy = ceil(wcdebugcoord select 1);
			wcdebugz = ceil(wcdebugcoord select 2);
			_listobjects = (position player) nearObjects 20;
			_nbobjects = count _listobjects;
			_nbobjects = [];
			_isflatempty = position player isflatempty [20, 0, 1, 20, 0, false]; 
			_text = format["
			Nb enemi: %1
			Time: %2
			EGrpCnt: %3
			WGrpCnt: %4
			level: %5
			maxenemyonmap: %6
			Coord: %7, %8, %9
			Nb objets near player: %10
			Isflatempty: %11
			", 
			wccounttotalunit,
			time, 
			wcgroupcounteast, 
			wcgroupcountwest, 
			wclevel, 
			wcmaxenemyonmap, 
			wcdebugx, 
			wcdebugy, 
			wcdebugz,
			_nbobjects,
			_isflatempty
			];
			hintsilent _text;
			if (wcdebugcopytoclipboard) then {
				copyToClipboard _text;
			};
			sleep 4;
			onMapSingleClick "player setPos _pos; true;";
		};
	};