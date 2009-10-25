

ac_members = [
            "=[A*C]= Snake Shit_^",
            "=[A*C]= Donovan",
            "=[A*C]= Papy",
            "=[A*C]= Nereflo",
            "=[A*C]= Koss",
            "=[A*C]= Schnitzer",
            "=[A*C]= Zark",
            "=[A*C]= code34",
            "=[A*C]= Z",
            "=[A*C]= Geb Green GG",
            "=[A*C]= Bogdard",
            "=[A*C]= G-KAR.71RG",
            "=[A*C]= ToMaSi",
            "=[A*C]= manukat",
            "=[A*C]= Sunshine",
            "=[A*C]= D-Styles",
            "=[A*C]= Lueti",
            "=[A*C]= D-joy",
            "=[A*C]= HancocK",
            "=[A*C]= M@T",
            "[DeltaFr]Alcyon",
            "[DeltaFr]Cobra",
            "[DeltaFr]Gerfaut",
            "[DeltaFr]Eagle",
            "[DeltaFr]Owl",
            "=BoB=Boogie",
            "=BoB=BreizooH",
            "=Bob=Chtigamer",
            "=BoB=Gandalf",
            "=BoB=Cable",
            "=BoB=Mimi",
            "=BoB=Nico9130",
            "=BoB=P4R4D1SO",
            "=BoB=Papa Tango Charlie",
            "=BoB=Ptitgars1",
            "=BoB=Skurcey",
            "=BoB=THI-FLY5",
            "=BoB=Tibo-Fr",
            "=BoB=Vivien",
            "=ADC=Snake-Eye"
            
];


ac_Isanac = {
	_ret = name player in ac_members;
	_ret;
};


//Création de la boite de dialogue Menu Option
ac_ShowDlgInfo = {
	_ok = createDialog "acInfoDLG";
	waitUntil { !dialog || !alive player };	
};



ac_GetPlayerList = {
	_side = side player;
	_trg = createTrigger ["EmptyDetector", [5000, 5000, 0]];
	_trg setTriggerActivation [_side, "PRESENT", true];
	_trg setTriggerArea [20000, 20000, 0, false];
	_trg setTriggerStatements ["this", "", ""];
	sleep 1;
	_playerList = list _trg;
	sleep 0.1;
	deletevehicle _trg;
	_playerList;
};

