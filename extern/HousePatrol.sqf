/*
=================================================================== 

		Random House Patrol Script v1.1
                        for Arma 2
		    by Tophe of Östgöta Ops [OOPS]

===================================================================

Contact & bugreport: harlechin@hotmail.com

====================================================================
HOW TO USE:

* Just put this: guard = [this] execVM "HousePatrol.sqf" 
  in the init field of a unit and put it next to or on a house.

OPTIONAL SETTINGS:

* You may also set the behaviour of the unit by putting the 
  prefered behaviour in the array.

  Like this: guard = [this,"COMBAT"] execVM "HousePatrol.sqf" 
  You may put any of these five:

    * "CARELESS"
    * "SAFE"
    * "AWARE"
    * "COMBAT"
    * "STEALTH". 

  If you don't put anything the default "SAFE" will be set.


* There is also an option to set the maximum amount of time (in seconds)
  that the unit will wait before moving to the next waypoint.
  
  To use this option the behaviour option must be set too.
  Example: guard = [this,"SAFE",50] execVM "HousePatrol.sqf" 

  If you don't put anything the default value of 30 will be set
  Use 0 as value if you want the guard to patrol continuesly.

====================================================================

*/

sleep 0.5;
if (!isServer) exitWith {};

// Setting variables

	_unit = _this select 0;
	_beh = if (count _this > 1) then {_this select 1} else {"SAFE"};
	_wtime = if (count _this > 2) then {_this select 2} else {30};
	if (_wtime < 0) then {_wtime = 30}; 

	_position = getPos _unit;
      _house = nearestBuilding _unit;
	_x = 0;
	_y = 0;
	_t = 0;
	_timeout = 0;
	_notbugged = true;
	_name = vehicleVarName _unit;
	if (isNil _name) then {_name = "guard"};


// Set the behaviour of the unit
	
	if (_beh == "CARELESS" 
	or _beh == "SAFE" 
	or _beh == "AWARE" 
	or _beh == "COMBAT" 
	or _beh == "STEALTH") 
	then {_unit setBehaviour _beh} 
	else {_unit setBehaviour "SAFE"};


// Find out the number of positions available in the building
// and put the unit at a random starting position

	while { format ["%1", _house buildingPos _x] != "[0,0,0]" } do {_x = _x + 1};
	_x = _x - 1;
	_unit setPos (_house buildingPos (random _x)); 
	if ((getPos _unit select 0 == 0) and (getPos _unit select 1 == 0)) then 
	{_unit setPos _position; _notbugged = false; 
	_unit globalChat format ["%1 can't patrol that building, due to game bug. Choose a different building",_name];
	};

// Have the unit patrol inside the house
	while {alive _unit and _notbugged} do
	{
		_y = random _x;
		_t = random (_wtime);
		_unit doMove (_house buildingPos _y);
		sleep 0.5;
		_timeout = time + 80;
		waitUntil {moveToCompleted _unit or moveToFailed _unit or !alive _unit or _timeout < time};
		sleep _t;
	};