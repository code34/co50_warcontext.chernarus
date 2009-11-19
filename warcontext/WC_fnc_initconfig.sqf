	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// WARCONTEXT - Description: init configuration file
	// -----------------------------------------------
	if (!isServer) exitWith{};
		
	// friendly side : resistance, east, west
	wcside 		= west;
	
	// enemy side
	wcenemyside	= east;

	// mission start at 0
	wclevel = 0;

	// limit of playable map
	wcmaptopright 	= [14000, 15000];
	wcmapbottomleft = [0, 1600];

	// number of missions in directory 
	wcnumberofmissions = 27;

	// number of campaigns in directory
	wcnumberofcampaigns = 2;

	// campaigns playable
	wccampaigns = [0,1,2];

	// missions playable
	wcmissions = [0,1,2,3,4,6,8,9,10,11,12,13,14,15,16,17,18,20,23,24,25,26,27];

	// debug for warcontext 
	wcdebug	= false;

	// copy debug to clipboard output
	// wcdebugcopytoclipboard = false;	

	// if set start at this position
	// wcdebugstartposition	= [7000, 7000,0];

	// size of dynamic zone generation. At 1500 of zone IA will begin to generate 
	wctriggersize 	= 800;

	// time in secondes before to garbage dead body
	wctimetogarbagedeadbody = 120;

	// maximun of enemy on map
	wcmaxenemyonmap = 1000;

	// initialise the group counter
	wcgroupcounteast = 0;
	wcgroupcountwest = 0;

	// initialise the index composition
	wccomposition = 0;

	// Index markeur merlin
	wcmerlinmrk = 0;

	// INFANTERY OPPOSITION
	switch (param1) do {
		case 1: {wcgroupsize = 5};
		case 2: {wcgroupsize = 6};
		case 3: {wcgroupsize = 7};
		case 4: {wcgroupsize = 8};
		case 5: {wcgroupsize = 9};
		default {wcgroupsize = 7};
	};

	// Set time
	skiptime (paramsArray select 2);

	// GAME MODE CAMPAIGN - RANDOM
	switch (paramsArray select 3) do {
		case 0: {wcgamemode = 0;};
		case 1: {wcgamemode = 1;};
		default {wcaalevel = 0;};
	};

	// AA SPAWNING LUCK
	switch (paramsArray select 4) do {
		case 0: {wcaalevel = 1;};
		case 1: {wcaalevel = 0.9;};
		case 2: {wcaalevel = 0.7;};
		case 3: {wcaalevel = 0.3;};
		case 4: {wcaalevel = 0.1;};
		default {wcaalevel = 0.7;};
	};

	// SHOW MARKERS
	switch (paramsArray select 5) do {
		case 0: {wcshowmarkers = false;};
		case 1: {wcshowmarkers = true;};
		default {wcshowmarkers = true;};
	};

	// IA level
	switch (paramsArray select 6) do {
		case 1: {wcskill = 0.1;};
		case 2: {wcskill = 0.3;};
		case 3: {wcskill = 0.7;};
		case 4: {wcskill = 1;};
		default {wcskill = 0.3;};
	};

	// AIRFORCE OPPOSITION
	switch (paramsArray select 7) do {
		case 0: {
			wcenemyair = [];
			};
		case 1: {
			wcenemyair = ["Mi17_rockets_RU", "Mi24_V"];
			};
		case 2: {
			wcenemyair = ["Mi17_rockets_RU", "Ka52", "Mi24_V"];
			};
		case 3: {
			wcenemyair = ["Mi17_rockets_RU", "Mi17_rockets_RU", "Ka52", "Mi24_V", "Su34"];
			};
		case 4: {
			wcenemyair = ["Mi17_rockets_RU", "Mi17_rockets_RU", "Mi17_rockets_RU", "Ka52", "Ka52", "Mi24_V", "Mi24_V", "Su34", "Su39"];
			};
		case 5: {
			wcenemyair = ["Mi17_rockets_RU", "Mi17_rockets_RU", "Mi17_rockets_RU", "Mi17_rockets_RU", "Mi24_V", "Mi24_V", "Su34","Su34","Su34","Su34", "Su39","Su39"];
			};
		case 6: {
			wcenemyair = ["Mi17_rockets_RU", "Mi17_rockets_RU", "Mi17_rockets_RU", "Mi17_rockets_RU", "Su34","Su34","Su34","Su34","Su34","Su34","Su34","Su34","Su39","Su39","Su39","Su39"];
			};
		default {wcenemyair = ["Mi17_rockets_RU", "Ka52", "Mi24_V"];};
	};

	// INFANTERY OPPOSITION
	switch (paramsArray select 8) do {
		case 0: { wcmaxenemyunit = 0; };
		case 1:	{ wcmaxenemyunit = 1; };
		case 2:	{ wcmaxenemyunit = 2; };
		case 3:	{ wcmaxenemyunit = 4; };
		case 4:	{ wcmaxenemyunit = 8; };
		default	{ wcmaxenemyunit = 2; };
	};

	// ARMORED OPPOSITION
	switch (paramsArray select 9) do {
		case 0: { wcmaxenemyvehicle = 0; };
		case 1: { wcmaxenemyvehicle = 1; };
		case 2:	{ wcmaxenemyvehicle = 2; };
		case 3:	{ wcmaxenemyvehicle = 4; };
		case 4:	{ wcmaxenemyvehicle = 8; };
		default	{ wcmaxenemyvehicle = 2; };
	};

	// TOWN NUMBERS
	switch (paramsArray select 10) do {
		case 1: { wctownnumbers = 2; };
		case 2:	{ wctownnumbers = 4; };
		case 3:	{ wctownnumbers = 6; };
		case 4:	{ wctownnumbers = 8; };
		default	{ wctownnumbers = 4; };
	};

	// NUMBER OF MISSIONS
	switch (paramsArray select 11) do {
		case 1: { wclevelmax = 2; };
		case 2: { wclevelmax = 4; };
		case 3:	{ wclevelmax = 6; };
		case 4:	{ wclevelmax = 8; };
		case 5: { wclevelmax = 10; };
		default	{ wclevelmax = 4; };
	};

	//  AA INFANTERY ON - OFF
	switch (paramsArray select 12) do {
		case 0: { wcaainfantery = false; };
		case 1: { wcaainfantery = true; };
		default	{ wcaainfantery = false; };
	};

	//  REINIT SCORE IF DIE
	switch (paramsArray select 13) do {
		case 0: { wcreinitscoreifdie = false; };
		case 1: { wcreinitscoreifdie = true; };
		default	{ wcreinitscoreifdie = false; };
	};

	//  BASE TO HOSPITAL TELEPORT
	switch (paramsArray select 14) do {
		case 0: { wchospitalteleport = false; };
		case 1: { wchospitalteleport = true; };
		default	{ wchospitalteleport = true; };
	};

	// init hospital
	wchospitalW = objNull;
	wchospitalE = objNull;

	// init ammoboxindex
	wcammoboxindex = 0;

	// init radar
	wcradarW = objNull;
	wcradarE = objNull;

	// init radio
	wcradioW = objNull;
	wcradioE = objNull;

	// init ammox box position
	wcammoboxpositionE = objNull;
	wcammoboxpositionW = objNull;

	// init paradropcargo
	wcparadropcargo = objNull;

	// initialize engine - dont edit
	wcinitialised = false;

	// contains all the groups
	wcgroups = [];

	// contains all markers
	wcarraymarker = [];

	// contains all town locations
	wctownlocations = [];

	// contains all markers position ammobox
	wcarrayammoboxpositionW = [];
	wcarrayammoboxpositionE = [];

	// init paradrop
	wcparadropcurrently = 0;

	// ending game
	wcgameend = false;

	// score send to player
	wcscore = 0;

	true;