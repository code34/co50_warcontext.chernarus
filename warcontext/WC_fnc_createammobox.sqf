	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// create an US ammobox on local client side
	// -----------------------------------------------
	 private [
		"_crate",
		"_position"
	];
	 
	_position = _this select 0;
	if (count _this > 1) then {_crate = _this select 1;_position = getposasl _crate;};
	 
	if(isnil "_crate") then {
		if (side player == wcside) then {
			_crate = "USVehicleBox" createVehiclelocal _position;
			_crate setpos _position;
		} else {
			_crate = "RUVehicleBox" createVehiclelocal _position;
			_crate setpos _position;
		};
	};

	ClearMagazineCargo _crate;
	ClearWeaponCargo _crate;

	wcammoboxindex = wcammoboxindex  + 1;
	nil = [format['wcammobox%1', wcammoboxindex], 0.5, _position, 'ColorYellow', 'ICON', 'FDIAGONAL', 'Select', 0, 'Ammobox', true] call WC_fnc_createmarkerlocal;

	if(side player == wcside) then {
		_crate addweaponcargo ["ITEMGPS",1];
		_crate addweaponcargo ["M9",50];
		_crate addweaponcargo ["M9SD",50];
		_crate addweaponcargo ["Colt1911",50];
		_crate addweaponcargo ["M16A2",50];
		_crate addweaponcargo ["M16A2GL",50];
		_crate addweaponcargo ["M16A4",50];
		_crate addweaponcargo ["M16A4_GL",50];
		_crate addweaponcargo ["M16A4_ACG",50];
		_crate addweaponcargo ["M16A4_ACG_GL",50];	
		_crate addweaponcargo ["M4A1",50];
		_crate addweaponcargo ["M4A1_HWS_GL",50];
		_crate addweaponcargo ["M4A1_HWS_GL_camo",50];
		_crate addweaponcargo ["M4A1_HWS_GL_SD_Camo",50];
		_crate addweaponcargo ["M4A1_RCO_GL",50];
		_crate addweaponcargo ["M4A1_Aim",50];
		_crate addweaponcargo ["M4A1_Aim_camo",50];
		_crate addweaponcargo ["M4A1_AIM_SD_camo",50];
		_crate addweaponcargo ["G36a",50];
		_crate addweaponcargo ["G36c",50];
		_crate addweaponcargo ["G36_C_SD_eotech",50];
		_crate addweaponcargo ["G36k",50];
		_crate addweaponcargo ["M1014",50];
		_crate addweaponcargo ["MP5A5",50];
		_crate addweaponcargo ["MP5SD",50];
		_crate addweaponcargo ["M8_carbine",50];
		_crate addweaponcargo ["M8_carbineGL",50];
		_crate addweaponcargo ["M8_compact",50];
		_crate addweaponcargo ["MG36",50];
		_crate addweaponcargo ["Mk_48",50];
		_crate addweaponcargo ["M240",50];
		_crate addweaponcargo ["M249",50];
		_crate addweaponcargo ["M8_SAW",50];
		_crate addweaponcargo ["M24",50];
		_crate addweaponcargo ["DMR",50];
		_crate addweaponcargo ["M107",50];
		_crate addweaponcargo ["M40A3",50];
		_crate addweaponcargo ["M4SPR",50];
		_crate addweaponcargo ["M8_sharpshooter",50];
		_crate addweaponcargo ["M136",50];
		_crate addweaponcargo ["SMAW",50];
		_crate addweaponcargo ["Laserdesignator",50];
		_crate addweaponcargo ["Binocular",50];
		_crate addweaponcargo ["NVGoggles",50];
		_crate addweaponcargo ["JAVELIN",1];
		_crate addweaponcargo ["STINGER",1];
		_crate addmagazinecargo ["Handgrenade",50];
		_crate addmagazinecargo ["HandGrenade_Stone",50];
		_crate addmagazinecargo ["Smokeshell",50];
		_crate addmagazinecargo ["Smokeshellred",50];
		_crate addmagazinecargo ["Smokeshellgreen",50];
		_crate addmagazinecargo ["SmokeShellYellow",50];
		_crate addmagazinecargo ["SmokeShellOrange",50];
		_crate addmagazinecargo ["SmokeShellPurple",50];
		_crate addmagazinecargo ["30Rnd_9x19_MP5",50];
		_crate addmagazinecargo ["30Rnd_9x19_MP5SD",50];
		_crate addmagazinecargo ["7Rnd_45ACP_1911",50];
		_crate addmagazinecargo ["15Rnd_9x19_M9",50];
		_crate addmagazinecargo ["15Rnd_9x19_M9SD",50];
		_crate addmagazinecargo ["20Rnd_556x45_Stanag",50];
		_crate addmagazinecargo ["30Rnd_556x45_Stanag",50];
		_crate addmagazinecargo ["30Rnd_556x45_StanagSD",50];
		_crate addmagazinecargo ["30Rnd_556x45_G36",50];
		_crate addmagazinecargo ["200Rnd_556x45_M249",50];
		_crate addmagazinecargo ["100Rnd_556x45_BetaCMag",50];
		_crate addmagazinecargo ["8Rnd_B_Beneli_74Slug",50];
		_crate addmagazinecargo ["5Rnd_762x51_M24",50];
		_crate addmagazinecargo ["20Rnd_762x51_DMR",50];
		_crate addmagazinecargo ["10Rnd_127x99_M107",50];
		_crate addmagazinecargo ["100Rnd_762x51_M240",50];
		_crate addmagazinecargo ["FlareWhite_M203",50];
		_crate addmagazinecargo ["FlareGreen_M203",50];
		_crate addmagazinecargo ["FlareRed_M203",50];
		_crate addmagazinecargo ["FlareYellow_M203",50];
		_crate addmagazinecargo ["1Rnd_HE_M203",50];
		_crate addmagazinecargo ["M136",500];
		_crate addmagazinecargo ["SMAW_HEAA",500];
		_crate addmagazinecargo ["SMAW_HEDP",500];
		_crate addmagazinecargo ["Pipebomb",30];
		_crate addmagazinecargo ["Mine",30];
		_crate addmagazinecargo ["Laserbatteries",20];
		_crate addmagazinecargo ["JAVELIN",1];
		_crate addmagazinecargo ["STINGER",1];
	} else {
		_crate addweaponcargo ["ITEMGPS",1];
		_crate addweaponcargo ["Makarov",50];
		_crate addweaponcargo ["MakarovSD",50];
		_crate addweaponcargo ["AK_74",50];
		_crate addweaponcargo ["AK_47_M",50];
		_crate addweaponcargo ["AK_47_S",50];
		_crate addweaponcargo ["AK_74_GL",50];
		_crate addweaponcargo ["AKS_74_U",50];
		_crate addweaponcargo ["AKS_74_kobra",50];
		_crate addweaponcargo ["AKS_74_UN_kobra",50];
		_crate addweaponcargo ["AKS_74_pso",50];	
		_crate addweaponcargo ["AK_107_kobra",50];
		_crate addweaponcargo ["AK_107_pso",50];
		_crate addweaponcargo ["AK_107_GL_kobra",50];
		_crate addweaponcargo ["AK_107_GL_pso",50];
		_crate addweaponcargo ["Bizon",50];
		_crate addweaponcargo ["bizon_silenced",50];
		_crate addweaponcargo ["Saiga12K",50];
		_crate addweaponcargo ["PK",50];
		_crate addweaponcargo ["Pecheneg",50];
		_crate addweaponcargo ["RPK_74",50];
		_crate addweaponcargo ["SVD",50];
		_crate addweaponcargo ["SVD_CAMO",50];
		_crate addweaponcargo ["KSVK",50];
		_crate addweaponcargo ["Huntingrifle",50];
		_crate addweaponcargo ["Igla",1];
		_crate addweaponcargo ["Strela",1];
		_crate addweaponcargo ["MetisLauncher",1];
		_crate addweaponcargo ["RPG18",50];
		_crate addweaponcargo ["RPG7V",50];
		_crate addweaponcargo ["Laserdesignator",50];
		_crate addweaponcargo ["Binocular",50];
		_crate addweaponcargo ["NVGoggles",50];
		_crate addmagazinecargo ["Handgrenade_East",50];
		_crate addmagazinecargo ["HandGrenade_Stone",50];
		_crate addmagazinecargo ["Smokeshell",50];
		_crate addmagazinecargo ["Smokeshellred",50];
		_crate addmagazinecargo ["Smokeshellgreen",50];
		_crate addmagazinecargo ["SmokeShellYellow",50];
		_crate addmagazinecargo ["SmokeShellOrange",50];
		_crate addmagazinecargo ["SmokeShellPurple",50];
		_crate addmagazinecargo ["8Rnd_9x18_Makarov",50];
		_crate addmagazinecargo ["8Rnd_9x18_MakarovSD",50];
		_crate addmagazinecargo ["30Rnd_545x39_AK",150];
		_crate addmagazinecargo ["30Rnd_545x39_AKSD",150];
		_crate addmagazinecargo ["30Rnd_762x39_AK47",50];
		_crate addmagazinecargo ["64Rnd_9x19_Bizon",50];
		_crate addmagazinecargo ["64Rnd_9x19_SD_Bizon",50];
		_crate addmagazinecargo ["8Rnd_B_Saiga12_74Slug",50];
		_crate addmagazinecargo ["10Rnd_9x39_SP5_VSS",50];
		_crate addmagazinecargo ["20Rnd_9x39_SP5_VSS",50];
		_crate addmagazinecargo ["100Rnd_762x54_PK",50];
		_crate addmagazinecargo ["75Rnd_545x39_RPK",50];
		_crate addmagazinecargo ["10Rnd_762x54_SVD",50];
		_crate addmagazinecargo ["5Rnd_127x108_Ksvk",50];
		_crate addmagazinecargo ["5x_22_LR_17_HMR",50];
		_crate addmagazinecargo ["Igla",1];
		_crate addmagazinecargo ["Strela",1];
		_crate addmagazinecargo ["AT13",1];
		_crate addmagazinecargo ["RPG18",50];
		_crate addmagazinecargo ["PG7V",50];
		_crate addmagazinecargo ["PG7VL",50];
		_crate addmagazinecargo ["PG7VR",50];
		_crate addmagazinecargo ["OG7",50];
		_crate addmagazinecargo ["Pipebomb",30];
		_crate addmagazinecargo ["Mine",30];
		_crate addmagazinecargo ["Laserbatteries",20];
	};
	_crate;