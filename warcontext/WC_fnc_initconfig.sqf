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
	wcmaptopright 	= [14000, 13000];
	wcmapbottomleft = [1600, 1800];

	// number of missions in directory 
	wcnumberofmissions = 25;

	// missions playable
	wcmissions = [0,1,2,3,4,6,8,9,10,11,12,13,14,15,16,17,18,19,25];

	// debug for warcontext 
	wcdebug		= true;

	// copy debug to clipboard output
	// wcdebugcopytoclipboard = false;	

	// Skill of IA 0 = min , 1 stronger
	wcskill		= 0.01;

	// if set start at this position
	// wcdebugstartposition	= [7000, 7000,0];

	// size of dynamic zone generation. At 1500 of zone IA will begin to generate 
	wctriggersize 	= 800;

	// maximun of enemy on map
	wcmaxenemyonmap = 1000;

	// initialize engine - dont edit
	wcinitialised = false;

	true;