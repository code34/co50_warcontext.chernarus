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

	// number of missions to play
	wclevelmax	= 4;

	// limit of playable map
	wcmaptopright 	= [14000, 15000];
	wcmapbottomleft = [0, 1600];

	// number of missions in directory 
	wcnumberofmissions = 26;

	// number of campaigns in directory
	wcnumberofcampaigns = 2;

	// campaigns playable
	wccampaigns = [0,1,2];

	// missions playable
	wcmissions = [0,1,2,3,4,6,8,9,10,11,12,13,14,15,16,17,18,20,23,24,25,26];

	// debug for warcontext 
	wcdebug	= false;

	// copy debug to clipboard output
	// wcdebugcopytoclipboard = false;	

	// Skill of IA 0 = min , 1 stronger
	wcskill		= 0.3;

	// if set start at this position
	// wcdebugstartposition	= [7000, 7000,0];

	// size of dynamic zone generation. At 1500 of zone IA will begin to generate 
	wctriggersize 	= 800;

	// maximun of enemy on map
	wcmaxenemyonmap = 1000;

	// initialise the group counter
	wcgroupcounteast = 0;
	wcgroupcountwest = 0;

	// initialise the index composition
	wccomposition = 0;

	// AA level
	switch (paramsArray select 4) do {
		case 1: {wcaalevel = 0.9;};
		case 2: {wcaalevel = 0.7;};
		case 3: {wcaalevel = 0.3;};
		case 4: {wcaalevel = 0.1;};
		default {wcaalevel = 0.7;};
	};

	// Show AA site
	switch (paramsArray select 5) do {
		case 0: {wcshowmarkers = false;};
		case 1: {wcshowmarkers = true;};
		default {wcshowmarkers = true;};
	};

	// initialize engine - dont edit
	wcinitialised = false;

	// contains all the groups
	wcgroups = [];

	// contains all markers
	wcarraymarker = [];

	true;