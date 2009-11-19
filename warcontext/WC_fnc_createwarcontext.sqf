	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private [
		"_markername",
		"_markersize",
		"_position", 
		"_object",
		"_objindex",
		"_locations",
		"_i",
		"_fuelstations",
		"_vehicles",
		"_currentlocation",
		"_distance",
		"_location",
		"_locations"
		];

	 // GET CITIES
	_locations = nearestLocations [[7000,7000], ["NameCityCapital", "NameCity","NameVillage", "Name"], 20000];

	// Wait result of nearestlocations
	sleep 5;
	
	for "_x" from 0 to wctownnumbers do { 
		_location = _locations call BIS_fnc_selectRandom;
		wctownlocations = wctownlocations + [_location];
		_locations = _locations - [_location];
	};


	// CREATE TRIGGER FOR CITIES
	_objindex = 0;
	{
		_x setSide wcenemyside;
		_markername = format ["mrk%1", _objindex];
		_object = "Land_telek1";
		_objindex = _objindex + 1;
		nil = [_x, _markername, _object, _objindex] spawn WC_fnc_createtrigger;
		sleep 0.1;
	} foreach wctownlocations;

	// CALL MAIN MISSION
	nil = [] spawn WC_fnc_liberateisland;

	// CREATE AIRPATROL
	{
		nil = [_x]  spawn WC_fnc_createairpatrol;
		sleep 0.5;
	}foreach wcenemyair;

	// create AA Site
	_locations = nearestLocations [[7000,7000], ["Hill"], 20000]; 
	_index = 0;
	{
		if( random 1 > wcaalevel) then {
			_position = position _x;
			_index = _index + 1;
			_target = "anti-air_ru1";
			_target = [_target, 0, _position] call EXT_fnc_createcomposition;
			_leader = leader _target;
			if(wcdebug or wcshowmarkers) then {
				[_leader, format["AA%1", _index], 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 30, 'AntiAir', 0 , 'AA SITE', true] spawn WC_fnc_attachmarker;
			} else {
				[_leader, format["AA%1", _index], 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 30, 'EMPTY', 0 , 'AA SITE', true] spawn WC_fnc_attachmarker;
			};
		};
		sleep 0.5;
	} foreach _locations;

	// REFRESH MARKERS
	WC_fnc_refreshmarker = {
		while {!wcgameend} do {
			{
				_position = getmarkerpos (_x select 0);
				(_x select 0) setMarkerPos _position;
				sleep 1;
			}foreach wcarraymarker;
			sleep 60;
		};
	};

	// REFRESH HOSPITAL MARKER
	WC_fnc_refreshhospitalmarker = {
		while {!wcgameend} do {
			if(!isnull wchospitalW and (format["%1", getmarkerpos "HOSPITAL"] == "[0,0,0]")) then {
				['WHOSPITAL', 0.5, position wchospitalW, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Headquarters', 0, 'HOSPITAL', true] call WC_fnc_createmarker;
			};
			if(isnull wchospitalW and (format["%1", getmarkerpos "HOSPITAL"] != "[0,0,0]")) then {
				wcarraymarker = wcarraymarker - ["WHOSPITAL"];
				deletemarker "WHOSPITAL";
			};
			if(!isnull wchospitalE and (format["%1", getmarkerpos "HOSPITAL"] == "[0,0,0]")) then {
				['EHOSPITAL', 0.5, position wchospitalE, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Headquarters', 0, 'HOSPITAL', true] call WC_fnc_createmarker;
			};
			if(isnull wchospitalE and (format["%1", getmarkerpos "HOSPITAL"] != "[0,0,0]")) then {
				wcarraymarker = wcarraymarker - ["EHOSPITAL"];
				deletemarker "EHOSPITAL";
			};
			sleep 4;
		};
	};


	wctrgradar = createTrigger["EmptyDetector", [0,0,0]];
	wctrgradar setTriggerArea[0,0,0,false];
	wctrgradar setTriggerActivation["ANY", "PRESENT", TRUE];
	wctrgradar setTriggerStatements["this", "", ""];

	wctrgradio = createTrigger["EmptyDetector", [0,0,0]];
	wctrgradio setTriggerArea[0,0,0,false];
	wctrgradio setTriggerActivation["ANY", "PRESENT", TRUE];
	wctrgradio setTriggerStatements["this", "", ""];

	// REFRESH RADAR MARKER
	WC_fnc_refreshradarmarker = {
		while {!wcgameend} do {
			if(!isnull wcradarW and (format["%1", getmarkerpos "RADAR"] == "[0,0,0]")) then {
				_markersize = ((getposasl wcradarW) select 2) * 5;
				_position = getpos wcradarW;
				nil = ["RADARFIELDW", _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarker;
				['RADARW', 0.5, _position, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Defend', 0, 'RADAR', true] call WC_fnc_createmarker;
				wctrgradar setpos _position;
				wctrgradar setTriggerArea[_markersize,_markersize,0,false];
			};
			if((isnull wcradarW and (format["%1", getmarkerpos "RADAR"] != "[0,0,0]")) or (!alive wcradarW)) then {
				wcarraymarker = wcarraymarker - ["RADARFIELDW"];
				deletemarker "RADARFIELDW";
				wcarraymarker = wcarraymarker - ["RADARW"];
				deletemarker "RADARW";
				deletevehicle wcradarW;
			};
			if(count (list wctrgradar) > 0) then {
				{
					if (_x iskindof "AIR") then {
						_position = position _x;
						_markername = format["%1", group _x];
						if ( format["%1", getmarkerpos _markername] == "[0,0,0]") then {
							[_x, format["%1", group _x], 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Dot', 0 , 'AIR', false, "RADARFIELDW"] spawn WC_fnc_attachmarkerinzone;
						};
						if (random 1 > 0.9) then {
							_x doTarget wcradarW;
							_x dofire wcradarW;
						};
					};
				}foreach (list wctrgradar);
			};
			sleep 4;
		};
	};

	// REFRESH RADIO MARKER WEST
	WC_fnc_refreshradiomarkerW = {
		while {!wcgameend} do {
			if(!isnull wcradioW and (format["%1", getmarkerpos "RADIOW"] == "[0,0,0]")) then {
				_markersize = ((getposasl wcradioW) select 2) * 5;
				_position = getpos wcradioW;
				nil = ["RADIOFIELDW", _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarker;
				['RADIOW', 0.5, _position, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Defend', 0, 'RADIOW', true] call WC_fnc_createmarker;
				wctrgradio setpos _position;
				wctrgradio setTriggerArea[_markersize,_markersize,0,false];
			};
			if((isnull wcradioW and (format["%1", getmarkerpos "RADIOW"] != "[0,0,0]")) or (!alive wcradioW)) then {
				wcarraymarker = wcarraymarker - ["RADIOFIELDW"];
				deletemarker "RADIOFIELDW";
				wcarraymarker = wcarraymarker - ["RADIOW"];
				deletemarker "RADIOW";
				deletevehicle wcradioW;
			};
			sleep 4;
		};
	};

	// REFRESH RADIOFIELDE MARKER EAST
	WC_fnc_refreshradiomarkerE = {
		while {!wcgameend} do {
			if(!isnull wcradioE and (format["%1", getmarkerpos "RADIOWE"] == "[0,0,0]")) then {
				_markersize = ((getposasl wcradioE) select 2) * 5;
				_position = getpos wcradioE;
				nil = ["RADIOFIELDE", _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL', '', 0, '', true] call WC_fnc_createmarker;
				['RADIOWE', 0.5, _position, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Defend', 0, 'RADIOWE', true] call WC_fnc_createmarker;
				wctrgradio setpos _position;
				wctrgradio setTriggerArea[_markersize,_markersize,0,false];
			};
			if((isnull wcradioE and (format["%1", getmarkerpos "RADIOWE"] != "[0,0,0]")) or (!alive wcradioE)) then {
				wcarraymarker = wcarraymarker - ["RADIOFIELDE"];
				deletemarker "RADIOFIELDE";
				wcarraymarker = wcarraymarker - ["RADIOWE"];
				deletemarker "RADIOWE";
				deletevehicle wcradioE;
			};
			sleep 4;
		};
	};



	nil = [] spawn WC_fnc_refreshmarker;
	sleep 1;
	nil = [] spawn WC_fnc_refreshhospitalmarker;
	sleep 1;
	nil = [] spawn WC_fnc_refreshradarmarker;
	sleep 1;
	nil = [] spawn WC_fnc_refreshradiomarkerW;
	sleep 1;

	true;