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
	wcnumberofmissions = 20;

	// missions playable
	wcmissions = [0,1,2,3,4,6,8,10];

	// debug for warcontext 
	wcdebug		= false;

	// copy debug to clipboard output
	wcdebugcopytoclipboard = false;	

	// initialize engine - dont edit
	wcinitialised = false;

	// if set start at this position
	// wcdebugstartposition	= [7000, 7000,0];

	// size of dynamic zone generation. At 1500 of zone IA will begin to generate 
	// wctriggersize 	= 800;

	// number max of unit by zone
	// wcmaxenemyunit = 10;

	// number max of enemy vehicle by zone
	// wcmaxenemyvehicle = 5;

	// enemy airfield position
	// wcenemyairfieldposition = [19263,13935,0];

	// Set global skill of IA 
	// 0 = min , 1 max (stronger)
	// wcskill		= 1;

	true;