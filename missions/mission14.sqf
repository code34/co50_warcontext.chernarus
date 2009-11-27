	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// MISSION TYPE: 
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private ["_rabbit", "_markername", "_position", "_counter", "_missionend", "_group", "_missionnumber"];

	wcmissionauthor ="=[A*C]= D-Styles";
   	wcmissionname = "Breack eye";
   	wcmissiondescriptionW = "Scientists from the Russian army had conceive with the help of umbrella corporation a virus. According to one of our chernarus contact, they had made a first experience on a rabbit that will release into the wild today ... We can not wait any longer ... find the rabbit before the virus begins its transformation.";
	wcmissiondescriptionE = "We are doing some experience. The experience base needs to be guard.";
	wcmissiontarget = "Scientists";
	_missionnumber = 14;

	_position = [wcmaptopright, wcmapbottomleft, "onflat"] call WC_fnc_createposition;
	wcmissionposition = _position;
	nil = [] spawn WC_fnc_publishmission;

	_markersize = 300;
	_markername = "rabbitzone";
	nil = [_markername, _markersize, _position, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_composition = [[[3.36816,-7.89746,0],333.024,"Land_runway_edgelight"],[[12.7573,-1.25586,0],180.322,"Fort_Crate_wood"],[[-3.23682,15.2129,0],179.745,"RU_WarfareBFieldhHospital"],[[9.70508,-14.8994,0],90.0563,"Land_Ind_Expedice_1"],[[-10.0684,15.2676,0],336.024,"Land_runway_edgelight"],[[12.501,20.9551,0],179.745,"RU_WarfareBBarracks"],[[25.0942,-12.833,0],179.745,"Ural_RU"],[[-21.5322,-19.5186,0],97.9881,"Gue_WarfareBContructionSite1"],[[0.871582,-30.1904,0],179.247,"Land_IndPipe2_big_18"],[[-31.7896,0.969727,0],179.745,"RU_WarfareBAntiAirRadar"],[[-21.2939,-24.4844,0],270.375,"Misc_Cargo1Bo_military"],[[2.02148,-33.6582,0],91.1576,"Ural_RU"],[[16.1021,-30.3154,0],333.024,"Land_runway_edgelight"],[[-21.4688,-27.9844,0],89.8636,"Gue_WarfareBContructionSite"],[[35.1738,-12.4668,0],0,"Misc_cargo_cont_tiny"],[[31.7593,24.377,0],333.024,"Land_runway_edgelight"],[[40.1636,-3.7002,0],180.101,"INS_WarfareBVehicleServicePoint"],[[-36.3794,-20.6162,0],0,"USMC_WarfareBContructionSite"],[[42.6772,5.79688,0],333.024,"Land_runway_edgelight"],[[-23.9849,39.2451,0],336.024,"Land_runway_edgelight"],[[-40.9766,-20.8926,0],0,"Land_Misc_Cargo2E"],[[-36.5718,-27.9521,0],358.597,"CDF_WarfareBContructionSite1"],[[47.0127,-14.7129,0],0,"Misc_palletsfoiled_heap"],[[46.6035,16.8564,0],179.987,"Land_A_Hospital"],[[19.0254,46.7949,0],333.024,"Land_runway_edgelight"],[[-42.3394,-29.8896,0],321.837,"CDF_WarfareBContructionSite"],[[51.9844,-6.9043,0],269.897,"Land_Ind_SawMillPen"],[[-37.8965,37.9502,0],180.026,"Land_A_BuildingWIP"],[[52.6714,-11.5303,0],330.024,"Land_runway_edgelight"],[[51.9775,-16.666,0],269.897,"Land_Ind_SawMillPen"],[[21.3604,50.6729,0],179.896,"Land_A_Office01"],[[-0.623535,55.708,0],180,"Fence_corrugated_plate"],[[3.35596,55.6963,0],180,"Fence_corrugated_plate"],[[27.02,-48.8955,0],333.024,"Land_runway_edgelight"],[[-4.4668,55.7314,0],180,"Fence_corrugated_plate"],[[-8.16309,55.7568,0],180,"Fence_corrugated_plate"],[[-11.8096,55.7822,0],180,"Fence_corrugated_plate"],[[-13.9536,55.8057,0],180,"Fence_corrugated_plate"],[[57.376,-9.05664,0],0,"Misc_cargo_cont_net2"],[[27.7891,-55.0469,0],269.923,"Land_Misc_WaterStation"],[[-61.6616,-1.48535,0],179.745,"Barrack2"],[[61.6108,-3.70313,0],90.4079,"Misc_cargo_cont_net3"],[[-60.4697,-13.4971,0],54.7957,"UAZ_RU"],[[-61.439,10.5654,0],0,"Barrack2"],[[-58.8418,-26.4941,0],0,"Misc_Cargo1B_military"],[[4.43311,-64.918,0],0,"Land_Ind_Pec_02"],[[14.1577,-63.9111,0],90.3255,"Land_Misc_GContainer_Big"],[[-61.5234,-26.5039,0],0,"Misc_Cargo1B_military"],[[-29.2441,-60.3369,0],0.344946,"Land_Misc_Scaffolding"],[[-19.3027,-64.9268,0],0,"Land_Ind_Pec_02"],[[52.7793,-42.8525,0],90.0026,"Land_Ind_Mlyn_03"],[[39.752,55.8281,0],180,"Fence_corrugated_plate"],[[62.6509,-28.8398,0],330.024,"Land_runway_edgelight"],[[43.2886,54.7754,0],215,"Fence_corrugated_plate"],[[45.311,53.3428,0],215,"Fence_corrugated_plate"],[[5.58887,69.96,0],336.024,"Land_runway_edgelight"],[[48.4092,51.1572,0],215,"Fence_corrugated_plate"],[[-70.6455,-1.51758,0],179.745,"Barrack2"],[[-51.957,-48.0957,0],322.666,"Land_CamoNetVar_EAST"],[[51.5381,48.9072,0],215,"Fence_corrugated_plate"],[[-36.5254,60.9443,0],330.024,"Land_runway_edgelight"],[[-70.6133,10.6875,0],0,"Barrack2"],[[-56.0376,-44.4775,0],291.03,"Land_Hlidac_budka"],[[54.604,46.6582,0],215,"Fence_corrugated_plate"],[[57.604,44.5078,0],215,"Fence_corrugated_plate"],[[-67.8481,-26.5205,0],0,"Misc_Cargo1B_military"],[[-48.8257,-54.0957,0],171.861,"Land_Hlidac_budka"],[[60.5713,42.3252,0],215,"Fence_corrugated_plate"],[[-72.7656,-14.8008,0],90,"Ural_RU"],[[63.7344,40.1035,0],215,"Fence_corrugated_plate"],[[-70.5942,-26.5459,0],0,"Misc_Cargo1B_military"],[[37.0142,-66.2227,0],330.024,"Land_runway_edgelight"],[[-70.3276,29.3643,0],180,"Land_Ind_TankSmall2"],[[51.8281,-55.9189,0],179.908,"Land_A_Office02"],[[-30.3354,-70.4902,0],179.745,"Sr_border"],[[66.7988,37.9209,0],215,"Fence_corrugated_plate"],[[-73.2935,-26.5391,0],0,"Misc_Cargo1B_military"],[[-60.8096,-49.0977,0],306.567,"Land_HBarrier5"],[[-34.4448,-70.5234,0],179.745,"Sr_border"],[[70.0273,35.6074,0],215,"Fence_corrugated_plate"],[[-54.5933,-57.1904,0],350.504,"Land_HBarrier5"],[[-79.3901,-1.39551,0],179.745,"Barrack2"],[[-38.3906,-69.9082,0],180.303,"datsun1_civil_2_covered"],[[-79.2651,10.7158,0],0,"Barrack2"],[[-38.4619,-70.4941,0],179.745,"Sr_border"],[[73.2549,33.2939,0],215,"Fence_corrugated_plate"],[[19.5645,-78.918,0],0.0329488,"Land_Misc_WaterStation"],[[-42.6279,-70.4971,0],179.745,"Sr_border"],[[76.4185,31.0107,0],215,"Fence_corrugated_plate"],[[-30.3867,-77.083,0],179.745,"Sr_border"],[[-30.3242,-77.2373,0],180.117,"UralCivil2"],[[-64.8535,-53.3574,0],320.255,"Land_HBarrier5"],[[-59.5317,-59.4854,0],318.643,"Land_HBarrier5"],[[-34.3462,-77.0547,0],179.745,"Sr_border"],[[-34.2686,-77.2676,0],0,"hilux1_civil_3_open"],[[79.5488,28.7607,0],215,"Fence_corrugated_plate"],[[83.8813,-16.8438,0],269.928,"Land_A_Office02"],[[-67.626,53.1992,0],270.105,"Land_Misc_Scaffolding"],[[72.645,-46.1582,0],330.024,"Land_runway_edgelight"],[[-38.374,-77.1523,0],179.745,"Sr_border"],[[82.7773,26.5117,0],215,"Fence_corrugated_plate"],[[87.5366,7.72656,0],270,"Fence_corrugated_plate"],[[-42.5732,-77.1924,0],179.745,"Sr_border"],[[-42.5952,-77.2529,0],0,"SkodaGreen"],[[87.5903,11.1699,0],270,"Fence_corrugated_plate"],[[87.5923,14.5557,0],270,"Fence_corrugated_plate"],[[38.9761,-80.0947,0],0,"Land_Misc_PowerStation"],[[86.0239,24.2568,0],215,"Fence_corrugated_plate"],[[87.6372,17.9453,0],270,"Fence_corrugated_plate"],[[87.6602,21.1982,0],270,"Fence_corrugated_plate"],[[0.992676,-90.6426,0],0.105995,"Fence_corrugated_plate"],[[-2.90088,-90.6396,0],0.105995,"Fence_corrugated_plate"],[[4.96826,-90.6436,0],0.105995,"Fence_corrugated_plate"],[[-6.87256,-90.6211,0],0.105995,"Fence_corrugated_plate"],[[-46.5195,78.2754,0],330.024,"Land_runway_edgelight"],[[8.93408,-90.6611,0],0.105995,"Fence_corrugated_plate"],[[-10.7578,-90.6318,0],0.105995,"Fence_corrugated_plate"],[[-68.0449,-61.1943,0],319.186,"Land_Fort_Watchtower"],[[12.7285,-90.665,0],0.105995,"Fence_corrugated_plate"],[[-77.5381,49.043,0],0,"Land_A_BuildingWIP"],[[-14.6665,-90.6309,0],0.105995,"Fence_corrugated_plate"],[[16.5332,-90.6758,0],0.105995,"Fence_corrugated_plate"],[[-80.3877,-45.2773,0],50,"Fence_corrugated_plate"],[[-18.3677,-90.6113,0],0.105995,"Fence_corrugated_plate"],[[-79.0483,-48.459,0],50,"Land_fortified_nest_small"],[[20.3696,-90.6777,0],0.105995,"Fence_corrugated_plate"],[[-82.751,-42.3857,0],50,"Fence_corrugated_plate"],[[-22.0884,-90.5908,0],0.105995,"Fence_corrugated_plate"],[[23.9927,-90.6602,0],0.105995,"Fence_corrugated_plate"],[[-85.0483,-39.6113,0],50,"Fence_corrugated_plate"],[[-93.7627,-5.55762,0],270.339,"Land_A_CraneCon"],[[-76.2402,-55.127,0],50.7676,"ZavoraAnim"],[[-25.8682,-90.5898,0],0.105995,"Fence_corrugated_plate"],[[-54.6689,-76.9258,0],50,"Fence_corrugated_plate"],[[-57.644,-74.791,0],50,"Land_fortified_nest_small"],[[-94.2744,9.13086,0],90.9068,"Land_Misc_deerstand"],[[-87.374,-36.752,0],50,"Fence_corrugated_plate"],[[27.7144,-90.6602,0],0.105995,"Fence_corrugated_plate"],[[-63.9092,-70.1699,0],50.7676,"ZavoraAnim"],[[-29.6284,-90.5508,0],0.105995,"Fence_corrugated_plate"],[[-52.3906,-79.6787,0],50,"Fence_corrugated_plate"],[[46.9937,-83.5322,0],330.024,"Land_runway_edgelight"],[[-89.7788,-33.8555,0],50,"Fence_corrugated_plate"],[[31.6958,-90.6689,0],0.105995,"Fence_corrugated_plate"],[[87.7261,-40.041,0],270,"Fence_corrugated_plate"],[[-49.9419,-82.5742,0],50,"Fence_corrugated_plate"],[[-33.4668,-90.5303,0],0.105995,"Fence_corrugated_plate"],[[-83.6621,48.2734,1.39999],180,"Land_Ind_BoardsPack2"],[[-83.6738,48.2822,0],180,"Land_Ind_BoardsPack2"],[[-92.1313,-31.0439,0],50,"Fence_corrugated_plate"],[[35.6787,-90.6738,0],0.105995,"Fence_corrugated_plate"],[[-36.4053,-90.5322,0],359.819,"Fence_corrugated_plate"],[[-47.5522,-85.4326,0],50,"Fence_corrugated_plate"],[[87.7075,-43.4395,0],270,"Fence_corrugated_plate"],[[-38.189,-90.5254,0],0.105995,"Fence_corrugated_plate"],[[-94.4399,-28.1025,0],50,"Fence_corrugated_plate"],[[39.6011,-90.6768,0],0.105995,"Fence_corrugated_plate"],[[-45.04,-88.373,0],50,"Fence_corrugated_plate"],[[87.6733,-46.8926,0],270,"Fence_corrugated_plate"],[[-41.9868,-90.2275,0],10.7702,"Fence_corrugated_plate"],[[-99.5874,1.07813,0],90,"Fence_corrugated_plate"],[[-99.5059,4.75293,0],90,"Fence_corrugated_plate"],[[-99.6289,-2.31348,0],90,"Fence_corrugated_plate"],[[-82.9614,55.3037,0],269.715,"PowerGenerator"],[[-99.4658,8.30664,0],90,"Fence_corrugated_plate"],[[-99.7261,-5.77441,0],90,"Fence_corrugated_plate"],[[-96.6499,-25.3594,0],50,"Fence_corrugated_plate"],[[-99.4248,11.8184,0],90,"Fence_corrugated_plate"],[[-99.772,-9.27539,0],90,"Fence_corrugated_plate"],[[43.3584,-90.6719,0],0.105995,"Fence_corrugated_plate"],[[-99.3838,15.4131,0],90,"Fence_corrugated_plate"],[[-99.8184,-12.6826,0],90,"Fence_corrugated_plate"],[[-86.5576,52.252,1.39999],269.463,"Land_Ind_BoardsPack2"],[[-86.5586,52.2666,0],269.659,"Land_Ind_BoardsPack2"],[[-99.334,18.9746,0],90,"Fence_corrugated_plate"],[[87.6069,-50.5205,0],270,"Fence_corrugated_plate"],[[-99.8643,-16.0361,0],90,"Fence_corrugated_plate"],[[-98.6733,-22.748,0],50,"Fence_corrugated_plate"],[[-99.9136,-19.4814,0],90,"Fence_corrugated_plate"],[[-99.334,22.252,0],90,"Fence_corrugated_plate"],[[-97.2422,30.3115,0],0.105995,"Fence_corrugated_plate"],[[-97.2656,30.3242,1.79999],0.105995,"Fence_corrugated_plate"],[[-97.2749,30.2998,4.89999],0.105995,"Fence_corrugated_plate"],[[-97.27,30.3193,6.60001],0.105995,"Fence_corrugated_plate"],[[-97.27,30.3311,3.39999],0.105995,"Fence_corrugated_plate"],[[-88.9126,49.9082,0],180,"Land_Barrel_empty"],[[46.9629,-90.6748,0],0.105995,"Fence_corrugated_plate"],[[-99.3013,25.6895,0],90,"Fence_corrugated_plate"],[[87.5923,-54.1396,0],270,"Fence_corrugated_plate"],[[-99.2515,29.1094,0],90,"Fence_corrugated_plate"],[[50.5908,-90.6699,0],0.105995,"Fence_corrugated_plate"],[[82.6411,-63.4834,0],330.024,"Land_runway_edgelight"],[[87.5991,-57.751,0],270,"Fence_corrugated_plate"],[[-99.3457,35.3164,0],90.478,"Fence_corrugated_plate"],[[-99.3716,35.3408,1.70001],90.478,"Fence_corrugated_plate"],[[-99.4043,35.333,3.29999],90.478,"Fence_corrugated_plate"],[[54.3286,-90.6875,0],0.105995,"Fence_corrugated_plate"],[[87.6074,-61.2686,0],270,"Fence_corrugated_plate"],[[58.3242,-90.7031,0],0.105995,"Fence_corrugated_plate"],[[87.5024,-64.6738,0],270,"Fence_corrugated_plate"],[[62.165,-90.6875,0],0.105995,"Fence_corrugated_plate"],[[87.4087,-68.1338,0],270,"Fence_corrugated_plate"],[[-103.179,40.9854,1],90.478,"Fence_corrugated_plate"],[[-56.5137,95.6035,0],330.024,"Land_runway_edgelight"],[[65.9561,-90.7041,0],0.105995,"Fence_corrugated_plate"],[[87.3984,-71.6387,0],270,"Fence_corrugated_plate"],[[-103.179,46.9639,1],90.478,"Fence_corrugated_plate"],[[69.748,-90.7207,0],0.105995,"Fence_corrugated_plate"],[[87.3521,-75.0635,0],270,"Fence_corrugated_plate"],[[56.9878,-100.851,0],330.024,"Land_runway_edgelight"],[[-103.083,52.9189,1],90.478,"Fence_corrugated_plate"],[[73.6943,-90.7148,0],0.105995,"Fence_corrugated_plate"],[[87.335,-78.3691,0],270,"Fence_corrugated_plate"],[[81.1987,-85.8799,0],307.223,"Land_Misc_deerstand"],[[-98.3989,66.7158,0],90.0631,"PowGen_Big"],[[77.5693,-90.7588,0],0.105995,"Fence_corrugated_plate"],[[87.3223,-81.792,0],270,"Fence_corrugated_plate"],[[81.3799,-90.7588,0],0.105995,"Fence_corrugated_plate"],[[87.3169,-85.2764,0],270,"Fence_corrugated_plate"],[[92.6304,-80.8096,0],330.024,"Land_runway_edgelight"],[[87.2661,-88.8047,0],270,"Fence_corrugated_plate"],[[85.3193,-90.7598,0],0.105995,"Fence_corrugated_plate"],[[-27.4233,127.023,0],330.024,"Land_runway_edgelight"],[[scalar,scalar,any],scalar,string]];
	nil = [_position, _composition, false] spawn WC_fnc_restorebuilding;

	_foldtable = "foldtable" createVehicle _position;
	_position2 = getposatl _foldtable;
	_notebook = "Notebook" createVehicle _position;
	_notebook allowDamage false;
	_notebook setposatl [_position2 select 0, _position2 select 1, (_position2 select 2) + 0.65];
	nil = ['Experience', 0.5, _position2, 'ColorRed', 'ICON', 'FDIAGONAL', 'Flag', 0, 'Experience'] call WC_fnc_createmarker;

	_rabbitgroup = creategroup east;
	_rabbit = _rabbitgroup createUnit ["rabbit", [_position2 select 0, (_position2 select 1) + 50], [], 0, "NONE"];
	_rabbit allowdammage false;
	_rabbitgroup allowFleeing 1;

	_notebook addAction ['Trace Rabbit', 'warcontext\WC_fnc_createtracer.sqf', [_rabbit, 'Hector'], 0, false, true, ''];

	_group = creategroup east;	
	_scientist1 = _group createUnit ["Doctor", [_position2 select 0, (_position2 select 1) +3], [], 0, "NONE"];
	_scientist2 = _group createUnit ["Doctor", [_position2 select 0, (_position2 select 1) +4], [], 0, "NONE"];

	_trg = createTrigger["EmptyDetector", _position]; 
	_trg setTriggerArea[5, 5 ,0,false];
	_trg setTriggerActivation["WEST","PRESENT", false];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcrabbitfound = true;
	"", """"];", wclevel];

	_trg2 = createTrigger["EmptyDetector", position _foldtable]; 
	_trg2 setTriggerArea[5, 5 ,0,false];
	_trg2 setTriggerActivation["WEST","PRESENT", false];
	call compile format ["_trg setTriggerStatements[""this"", ""
		wcnotebookactive = true;
	"", """"];", wclevel];

	nil = [_rabbit, _trg, 2] spawn WC_fnc_attachtrigger;

	_counter = 0;
	_missionend = false;
	while { !_missionend } do {
		if (wcnotebookactive) then {
			deletevehicle _trg2;
			nil = [_rabbit, 'Hector', 0.5, 'ColorRed', 'ICON', 'FDIAGONAL', 2, 'Dot', 0 , 'Hector'] spawn WC_fnc_attachmarker;
		};
		if (wcrabbitfound) then {
			wcmissionokW = [_missionnumber,true];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: West wins ! Hector has been found.'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (getdammage _rabbit < 0.8) then {
			_position = [_markername] call WC_fnc_createpositioninmarker;
			_rabbit doMove _position;
		};
		if (_counter > 30) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,true];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: East wins !Rabbit has infected the region'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		if (count (units _group) < 2) then {
			wcmissionokW = [_missionnumber,false];
			publicvariable 'wcmissionokW';
			wcmissionokE = [_missionnumber,false];
			publicvariable 'wcmissionokE';
			nil = [nil,nil,rHINT,'Side mission: Nobody wins !Iminent Scientists have been killed!'] call RE;
			wcmissionclear = true;
			wcscore = 10;
			nil = [wcscore, wcenemyside] spawn WC_fnc_score;
			_missionend = true;
		};
		_counter = _counter + 1;
		sleep 60;
	};

	deletevehicle _trg;
	deletevehicle _rabbit;
	_scientist1 setdammage 1;
	deletevehicle _scientist1;
	_scientist2 setdammage 1;
	deletevehicle _scientist2;